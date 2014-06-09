module Quickeebooks
  module Online
    module Service
      class Entitlement < ServiceBase

        def status
          url = url_for_base("manage/entitlements")
          response = do_http_get(url)
          
          xml = parse_xml(response.body)
          return Quickeebooks::Online::Model::Entitlements.new(xml)
        end

      end
    end
  end
end
