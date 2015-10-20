require "spec_helper"

describe "FarMar::Vendor" do
  before :each do
  	vendor_hash = {
    	:identifier => 	 1,
			:name => 				 "Feil-Farrell",
			:no_employees => 8,
			:market_id =>  	 1
    }

    @vendor = FarMar::Vendor.new(vendor_hash)
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
end