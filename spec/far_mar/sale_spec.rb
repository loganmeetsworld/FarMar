require "spec_helper"

describe "FarMar::Sale" do
  before :each do
  	sales_hash = {
    	:identifier => 		1,
			:amount => 		 		9290,
			:purchase_time => "2013-11-07 04:34:56 -0800",
			:vendor_id => 		1,
			:product_id => 		1
    }

    @sale = FarMar::Sale.new(sales_hash)
  end

  context "initializing" do
    it "returns a sale object" do
      expect(@sale).to be_an_instance_of FarMar::Sale
    end
  end

  describe "#self.all" do
  	it "returns collection of Sale instances" do
  		expect(FarMar::Sale.all.class).to eq Array
  	end

  	it "returns all 500 instances" do
  		expect(FarMar::Sale.all.length).to eq 12798
  	end

  	it "returns the data accurately" do 
  		expect(FarMar::Sale.all[0].identifier).to eq 1
  		expect(FarMar::Sale.all[4].identifier).to eq 5
  	end
  end

  describe "#self.find(id)" do 
  	it "returns the id" do 
  		expect(FarMar::Sale.find(2)).to be_an_instance_of FarMar::Sale
  		expect(FarMar::Sale.find(2).amount).to eq 2262
  	end
  end
end