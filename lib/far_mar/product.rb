module FarMar
	class Product < LookUp

		attr_accessor :identifier, :name, :vendor_id

		def initialize(product_hash)
			@identifier = product_hash[:identifier]
			@name = product_hash[:name]
			@vendor_id = product_hash[:vendor_id]
		end

		def self.all
			@@products ||= []

			if @@products == []
				CSV.read("support/products.csv").each do |row|
					product_hash = {:identifier => row[0].to_i, :name => row[1], 
												  :vendor_id => row[2].to_i
												 }
					@@products.push(Product.new(product_hash))
				end
			end

			return @@products
		end

		def self.find(id)
			super
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
			sales_hash = FarMar::Sale.sales_by_product
			return sales_hash[@identifier]
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

		def revenue
			super
		end

		def self.most_revenue(n)
			self.all.max_by(n) { |product| product.revenue }
		end
	end
end