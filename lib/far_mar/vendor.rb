module FarMar
	class Vendor

		attr_accessor :identifier, :name, :no_employees, :market_id

		def initialize(vendor_hash)
			@identifier = 	vendor_hash[:identifier]
			@name = 				vendor_hash[:name]
			@no_employees = vendor_hash[:no_employees]
			@market_id = 		vendor_hash[:market_id]
		end

		def self.all 
			vendor_csv = CSV.read("support/vendors.csv")

			vendors = []

			vendor_csv.each do |row|
				vendor_hash = {:identifier => row[0].to_i, :name => row[1], 
											 :no_employees => row[2], :market_id => row[3].to_i
											}
				vendors.push(Vendor.new(vendor_hash))
			end

			return vendors
		end

		def self.find(id)
			self.all.find do |line|
				line.identifier.to_i == id
			end
		end

		def market
			vendor_market_array = FarMar::Market.all

			vendor_market_array.each do |row|
				if row.identifier == @market_id
					return row
				end
			end
		end

		# def products
		# end

		# def sales
		# end

		# def revenue
		# end

		# def self.by_market(market_id)
		# end
	end
end