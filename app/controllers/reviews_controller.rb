class ReviewsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_review, only: [:edit, :update, :destroy]
    
    def edit
    end

    def create
      @review = current_user.reviews.new(review_params)

      respond_to do |format|
        if @review.save
          format.html { redirect_to @review, notice: 'Review was successfully created.' }
          format.json { render :show, status: :created, location: @review }
        else
          format.html { render :new }
          format.json { render json: @review.errors, status: :unprocessable_entity }
        end
      end
    end
    
    def update
    end
    
    def destroy
    end
    
    private
    
    def set_review
        @review = Review.find(params[:id])
    end
    
    def review_params
        params.require(:review).permit(:content, :place_id)
    end
end
