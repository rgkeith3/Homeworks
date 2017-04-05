require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef") }

  describe "#initialize" do
    let(:chef) {double("Mama")}
    subject(:cake) {Dessert.new("cake", 2, chef)}

    it "sets a type" do
      expect(cake.type).to eq("cake")
    end

    it "sets a quantity" do
      expect(cake.quantity).to eq(2)
    end

    it "starts ingredients as an empty array" do
      expect(cake.ingredients).to eq([])
    end

    it "raises an argument error when given a non-integer quantity" do
      expect{Dessert.new("cake", "whoa dude", chef)}.to raise_error
    end
  end

  subject(:cookies) {Dessert.new("cookies", 12, chef)}

  describe "#add_ingredient" do
    before(:each) do
      cookies.add_ingredient("eggs")
    end
    it "adds an ingredient to the ingredients array" do
      expect(cookies.ingredients).to eq(["eggs"])
    end
  end

  describe "#mix!" do
    before(:each) do
      cookies.add_ingredient("eggs")
      cookies.add_ingredient("flour")
      cookies.add_ingredient("sugar")
      cookies.add_ingredient("milk")
      cookies.mix!
    end
    it "shuffles the ingredient array" do
      expect(cookies.ingredients).not_to eq(["eggs", "flour", "sugar", "milk"])
    end
  end

  describe "#eat" do
    before(:each) do
      cookies.eat(2)
    end
    it "subtracts an amount from the quantity" do
      expect(cookies.quantity).to eq(10)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect{cookies.eat(15)}.to raise_error
    end
  end
  let(:enrique) {double(:titleize => "Chef Enrique the Great Baker")}
  subject(:flan) {Dessert.new("flan", 3, enrique)}
  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      expect(flan.serve).to include("Chef Enrique the Great Baker")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(enrique).to receive(:bake).with(flan)
      flan.make_more
    end
  end
end
