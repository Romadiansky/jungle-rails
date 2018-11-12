class ReviewsController < ApplicationController
  before_filter :authorize


  def create
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new(review_params)
    @review.user = current_user
    if @review.save
      redirect_to product_path(@product), notice: "Thanks for reviewing our product"
    else
      render "products/show"
    end
  end

  def destroy
    review = Review.find(params[:id])
    if review.user == current_user
      review.destroy
      redirect_to product_path(review.product), notice: "You successfully deleted your review."
    else
      redirect_to product_path(review.product)
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :description)
  end

end
