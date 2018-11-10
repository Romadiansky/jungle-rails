class CategoriesController < ApplicationController

  def show
    @category = Category.find(params[:id])
    @products = @category.products.kept.order(created_at: :desc)
  end

end
