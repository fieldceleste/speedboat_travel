class ReviewsController < ApplicationController
  
  def index 
    @reviews = Review.all
    json_response(@reviews)
  end

  def show
    @review = Review.find(params[:id])
    json_response(@review)
  end

  def create 
    @review = Review.create(review_params)
    json_response(@review)
  end
  
  def update
    @review = Review.find(params[:id])
    @review.update(review_params)
  end

  private 
  def json_response(object, status = :ok)
    render json: object, status: status
  end

  def review_params
    params.permit(:author, :content, :city, :country)
  end
end