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

			products = []

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

		# def vendor
		# end

		# def sales
		# end

		# def number_of_sales
		# end

		# def self.by_vendor(vendor_id)
		# end
	end
end