require "spec_helper"

describe "FarMar::Vendor" do
  before :each do
  	vendor_hash = {
    	:identifier => 	 2,
			:name => 				 "Feil-Farrell",
			:no_employees => 8,
			:market_id =>  	 3
    }

    vendor_hash_2 = {
      :identifier =>   1,
      :name =>         "Rando Market",
      :no_employees => 20,
      :market_id =>    28
    }

    @vendor = FarMar::Vendor.new(vendor_hash)
    @vendor_2 = FarMar::Vendor.new(vendor_hash_2)
  end

  context "initializing" do
    it "returns a vendor object" do
      expect(@vendor).to be_an_instance_of FarMar::Vendor
    end
  end

  describe "#self.all" do
  	it "returns collection of vendor instances" do
  		expect(FarMar::Vendor.all.class).to eq Array
  	end
  	it "returns all 500 instances" do
  		expect(FarMar::Vendor.all.length).to eq 2690
  	end
  	it "returns the data accurately" do 
  		expect(FarMar::Vendor.all[0].identifier).to eq 1
  		expect(FarMar::Vendor.all[2689].identifier).to eq 2690
  	end
  end

  describe "#self.find(id)" do 
  	it "returns the id" do 
  		expect(FarMar::Vendor.find(25)).to be_an_instance_of FarMar::Vendor
  		expect(FarMar::Vendor.find(25).name).to eq "Veum, Dickinson and Conroy"
  	end
  end

  describe "#market" do
    it "is an Object" do
      market_vendor = @vendor.market
      expect(market_vendor).to be_an Object
      expect(market_vendor).to be_an_instance_of FarMar::Market
    end

    it "returns the FarMar::Market instance associated with the FarMar::Vendor" do
      market_vendor_1 = @vendor.market
      market_vendor_2 = @vendor_2.market

      expect(market_vendor_1.identifier).to eq 3 # returns the market_id instead of the vendor_id
      expect(market_vendor_2.identifier).to eq 28
    end
  end

  describe "#products" do
    it "returns a collection of product instances" do
      product = @vendor.products 
      expect(product).to be_an Array
      expect(product.length).to eq 2
    end
  end

  describe "#sale" do
    it "returns a collection of sale instances" do
      sale = @vendor.sales 
      expect(sale).to be_an Array
      expect(sale.length).to eq 1
    end
  end

  describe "#revenue" do 
    it "returns the sum of sales" do 
      expect(@vendor.revenue).to eq 5727
      expect(@vendor_2.revenue).to eq 38259
    end
  end

  describe "#self.by_market(market_id)" do 
    it "returns all the vendors w given market id" do 
    end
  end

end