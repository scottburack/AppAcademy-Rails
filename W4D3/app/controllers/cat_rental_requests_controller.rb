class CatRentalRequestsController < ApplicationController
  
  before_action :current_user_owns_cat?, only: [:approve, :deny]
  before_action :redirect_unless_logged_in, only: [:approve, :deny] 
  
  
  def approve
    current_cat_rental_request.approve!
    redirect_to cat_url(current_cat)
  end

  def create
    @rental_request = CatRentalRequest.new(cat_rental_request_params)
    @rental_request.user_id = current_user.id
    if @rental_request.save
      redirect_to cat_url(@rental_request.cat)
    else
      flash.now[:errors] = @rental_request.errors.full_messages
      render :new
    end
  end

  def deny
    current_cat_rental_request.deny!
    redirect_to cat_url(current_cat)
  end

  def new
    @rental_request = CatRentalRequest.new
  end

  private

  def current_cat_rental_request
    @rental_request ||=
      CatRentalRequest.includes(:cat).find(params[:id])
  end

  def current_cat
    current_cat_rental_request.cat
  end

  def cat_rental_request_params
    params.require(:cat_rental_request).permit(:cat_id, :end_date, :start_date, :status)
  end
  
  def current_user_owns_cat?
    rental_request = CatRentalRequest.find_by(id: params[:id])
    @cat = Cat.find_by(id: rental_request.cat_id)
    if current_user
      redirect_to cat_url(@cat) unless current_user.cats.include?(@cat)
    else
      redirect_to cat_url(@cat) unless current_user
    end
  end

end
