module FarMar
	class Lookup
		class << self 

			["identifier", "name", "address", "city", "county", "state", "zip"].each do |attribute|
		  	define_method("find_by_#{attribute}") do |argument|
			    case attribute
			    when "identifier"
			      self.all.find do |market|
			      	if market.respond_to?(attribute)
				      	market.method(attribute).call == argument
			      	end
			      end
			    when "name", "city", "address", "county", "state", "zip"
			      self.all.find do |market| 
			      	if market.respond_to?(attribute)
				      	market.method(attribute).call.match(/#{Regexp.escape(argument)}/i)
			    		end
			    	end
			    end
		  	end
		  end
		end

		class << self 

			["id", "name", "address", "city", "county", "state", "zip"].each do |attribute|
		  	define_method("find_all_by_#{attribute}") do |argument|
			    case attribute
			    when "id"
			      self.all.find_all do |market| 
			      	if market.respond_to?(attribute)
			      		market.method(attribute).call == argument 
			      	end
			      end
			    when "name", "city", "address", "county", "state", "zip"
			      self.all.find_all do |market| 
			      	if market.respond_to?(attribute)
			      		market.method(attribute).call.match(/#{Regexp.escape(argument)}/i)
			    		end
			    	end
			    end
		  	end
		  end
		end
	end
end