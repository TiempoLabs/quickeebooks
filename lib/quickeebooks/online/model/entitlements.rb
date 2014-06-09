require "quickeebooks"

module Quickeebooks
  module Online
    module Model
      class Entitlements
        
        def initialize(xml)
        	@xml = xml        	
        end

        def has_payroll()
        	found = false
        	
        	found = has_entitlement('Do-it-yourself Payroll') if (!found)
        	found = has_entitlement('Do-it-yourself Payroll (Paycycle)') if (!found)

        	return found
        end

        def has_entitlement(entitlement_name)
        	response = false

        	results = @xml.xpath("//*[contains(text(), '#{entitlement_name}')]")
        	name_node = nil
        	results.each do |result|
        		if (result.text() == entitlement_name)
        			name_node = result
        			break
        		end
        	end

        	if (name_node)
        		parent = name_node.parent()
        		term = parent.xpath('term').first.text()
        		if (term && term == "On")
        			response = true
        		end
        	end

        	return response
        end

      end
    end
  end
end
