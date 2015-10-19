require "spec_helper"

describe "creating a product class" do
  before :each do
    @product = FarMar::Product.new
  end

  context "initializing" do
    it "returns a dictionary object" do
      expect(@product).to be_an_instance_of FarMar::Product
    end
  end
end