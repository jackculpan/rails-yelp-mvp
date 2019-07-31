class ReviewsController < ApplicationController
  def index
    @restaurant = Restaurant.find(params[:restaurant_id])
    @reviews = @restaurant.reviews
  end

  def show
    # @restaurant = Restaurant.find(params[:id])
    # @review = @restaurant.review
    @review = Review.find(params[:id])
  end

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])

    @review = Review.new(review_params)
    @review.restaurant = @restaurant

    if @review.save
      redirect_to restaurants_path(@restaurant.id)
    else
      render :new
    end
  end

  def review_params
    return params.require(:review).permit(:content, :rating)
  end
end
