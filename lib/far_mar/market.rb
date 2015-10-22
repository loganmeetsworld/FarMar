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
			market_csv = CSV.read("support/markets.csv")

			markets = []

			market_csv.each do |row|
				market_hash = {:identifier => row[0].to_i, :name => row[1], 
											 :address => row[2], :city => row[3], 
											 :county => row[4], :state => row[5],
											 :zip => row[6]
											}
				markets.push(Market.new(market_hash))
			end

			return markets
		end

		def self.find(id)
			self.all.find do |line|
				line.identifier.to_i == id
			end
		end

		def vendors
			FarMar::Vendor.all.find_all { |vendor| vendor.market_id == @identifier}
		end

		def products
			products = FarMar::Product.all
			product_array = []

			vendors.zip(products).each do |vendor, product|
				if vendor.identifier == product.vendor_id
					product_array.push(product)
				end
			end
			product_array
		end

		def self.search(search_term)
			market_array = []
			vendor_array = []

			FarMar::Vendor.all.find_all do |vendor|
				if vendor.name.match(/#{Regexp.escape(search_term)}/i)
					vendor_array.push(vendor)
				end
			end

			vendor_array.each do |row|
				if row.identifier == @market_id
					market_array.push(row)
				end
			end

			self.all.find_all do |market|
				if market.name.match(/#{Regexp.escape(search_term)}/i) 
					market_array.push(market)
				end
			end

			return market_array
		end
	end
end