require "spec_helper"

describe "FarMar::Vendor" do
  before :each do
  	vendor_hash = {
    	:identifier => 	 1,
			:name => 				 "Feil-Farrell",
			:no_employees => 8,
			:market_id =>  	 3
    }

    vendor_hash_2 = {
      :identifier =>   6,
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

end