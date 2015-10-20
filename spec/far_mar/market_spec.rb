require "spec_helper"

describe "FarMar::Market" do
  before :each do
    market_hash = {
    	:identifier => 1,
			:name => 			"People's Co-op Farmers Market",
			:address => 	"30th and Burnside",
			:city => 			"Portland",
			:county => 		"Multnomah",
			:state => 		"OR",
			:zip => 			97202
    }

    @market = FarMar::Market.new(market_hash)
  end

  context "initializing" do
    it "returns a market object" do
      expect(@market).to be_an_instance_of FarMar::Market
    end
  end

  describe "#self.all" do
  	it "returns collection of market instances" do
  		expect(FarMar::Market.all.class).to eq Array
  	end
  	it "returns all 500 instances" do
  		expect(FarMar::Market.all.length).to eq 500
  	end
  	it "returns the data accurately" do 
  		expect(FarMar::Market.all[0].identifier).to eq 1
  		expect(FarMar::Market.all[499].identifier).to eq 500
  	end
  end

  describe "#self.find(id)" do 
  	it "returns the id" do 
  		expect(FarMar::Market.find(2)).to be_an_instance_of FarMar::Market
  		expect(FarMar::Market.find(2).name).to eq "Silverdale Farmers Market"
  	end
  end

  describe "#vendors" do
    it "returns a collection of vendor instances" do 
      vendor = @market.vendors
      expect(vendor).to be_an Array
      expect(vendor[0]).to be_an_instance_of FarMar::Vendor
      expect(vendor.length).to eq 6
    end
  end
end