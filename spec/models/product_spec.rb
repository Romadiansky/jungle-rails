require 'rails_helper'

RSpec.describe Product, type: :model do

  before :each do
    @category = Category.new(name: 'testing-category')
  end

  describe 'Validations' do
    it 'should save successfully' do
      @product = Product.new
      @product.name = 'given name'
      @product.price = 2
      @product.quantity = 5
      @product.category = @category
      expect(@product.save).to be true
    end

    it 'should have a name' do
      @product = Product.new
      @product.price = 2
      @product.quantity = 5
      @product.category = @category
      expect(@product.save).to be false
    end


    it 'should have a price' do
      @product = Product.new
      @product.name = 'given name'
      @product.quantity = 5
      @product.category = @category
      expect(@product.save).to be false
    end

    it 'should have a quantity' do
      @product = Product.new
      @product.name = 'given name'
      @product.price = 2
      @product.category = @category
      expect(@product.save).to be false
    end

    it 'should have a category' do
      @product = Product.new
      @product.name = 'given name'
      @product.quantity = 5
      @product.price = 2
      expect(@product.save).to be false
    end

  end
end
