class ProductsController < ApplicationController

  def index
    @products = Product.where(:discarded_at => nil).order(created_at: :desc)
    # @products = Product.kept.order(created_at: :desc) <-- same same ^^-)
  end


  def show
    @product = Product.find params[:id]
    @review = Review.new
  end

end
