module FarMar
	class Sale

		attr_accessor :identifier, :amount, :purchase_time, :vendor_id, :product_id

		def initialize(sales_hash)
			@identifier = 	 sales_hash[:identifier]
			@amount = 			 sales_hash[:amount]
			@purchase_time = sales_hash[:purchase_time]
			@vendor_id = 		 sales_hash[:vendor_id]
			@product_id = 	 sales_hash[:product_id]
		end

		def self.all
			sale_csv = CSV.read("support/sales.csv")

			sales = []

			sale_csv.each do |row|
				sale_hash = {:identifier => row[0].to_i, :amount => row[1].to_i, 
										 :purchase_time => row[2], :vendor_id => row[3], 
										 :product_id => row[4]
										}
				sales.push(Sale.new(sale_hash))
			end

			return sales
		end

		def self.find(id)
			self.all.find do |line|
				line.identifier.to_i == id
			end
		end

		# def vendor
		# end

		# def product
		# end

		# def self.between(begin_time, end_time)
		# end
		
	end
end