module FarMar
	class Product

		attr_accessor :identifier, :name, :vendor_id

		def initialize(product_hash)
			@identifier = product_hash[:identifier]
			@name = product_hash[:name]
			@vendor_id = product_hash[:vendor_id]
		end

		def self.all
			product_csv = CSV.read("support/products.csv")

			products ||= []

			product_csv.each do |row|
				product_hash = {:identifier => row[0].to_i, :name => row[1], 
											  :vendor_id => row[2].to_i
											 }
				products.push(Product.new(product_hash))
			end

			return products
		end

		def self.find(id)
			self.all.find do |line|
				line.identifier.to_i == id
			end
		end

		def vendor
			vendor_product_array = FarMar::Vendor.all

			vendor_product_array.each do |row|
				if row.identifier == @vendor_id
					return row
				end
			end
		end

		def sales
			sales_array = FarMar::Sale.all
			return sales_array.find_all { |sale| sale.product_id == @identifier }
		end

		def number_of_sales
			sales.length
		end

		def self.by_vendor(vendor_id)
			product_array = []
			self.all.each do |line|
				if line.vendor_id == vendor_id
					product_array << line
				end
			end
			return product_array
		end
	end
end