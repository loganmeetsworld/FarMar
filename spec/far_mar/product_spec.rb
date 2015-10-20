require "spec_helper"

describe "FarMar::Product" do
  before :each do
  	product_hash = {
    	:identifier => 1,
			:name => 			"Dry Beets",
			:vendor_id =>  1
    }

    @product = FarMar::Product.new(product_hash)
  end

  context "initializing" do
    it "returns a product object" do
      expect(@product).to be_an_instance_of FarMar::Product
    end
  end

  describe "#self.all" do
  	it "returns collection of product instances" do
  		expect(FarMar::Product.all.class).to eq Array
  	end
  	it "returns all 500 instances" do
  		expect(FarMar::Product.all.length).to eq 8193
  	end
  	it "returns the data accurately" do 
  		expect(FarMar::Product.all[0].identifier).to eq 1
  		expect(FarMar::Product.all[8192].identifier).to eq 8193
  	end
  end

  describe "#self.find(id)" do 
  	it "returns the id" do 
  		expect(FarMar::Product.find(25)).to be_an_instance_of FarMar::Product
  		expect(FarMar::Product.find(25).name).to eq "Helpless Bread"
  	end
  end
end