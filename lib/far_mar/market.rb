module FarMar
	class Market

		attr_accessor :identifier, :name, :address, :city, :county, :state, :zip

		def initialize(market_hash)
			@identifier = market_hash[:identifier]
			@name = 			market_hash[:name]
			@address = 		market_hash[:address]
			@city = 			market_hash[:city]
			@county = 		market_hash[:county]
			@state = 			market_hash[:state]
			@zip = 				market_hash[:zip]
		end
		def self.all
			market_csv = CSV.read("./support/market.csv")

			market_array = []

			owner_csv.each do |row|
				market_hash = {:identifier => row[0], :name => row[1], 
											 :address => row[2], :street => row[3], 
											 :city => row[4], :state => row[5]}
				owners_array.push(Market.new(market_hash))
			end
			return owners_array

			#returns a collection of Market instances, 
			#representing all of the markets described 
			#in the CSV
		end

		def self.find(id)
			#returns an instance of Market where the 
			#value of the id field in the CSV matches the 
			#passed parameter
		end

		def vendors
			#returns a collection of vendor 
			#instances that are associated with 
			#the market by the market_id field
		end

	end
end