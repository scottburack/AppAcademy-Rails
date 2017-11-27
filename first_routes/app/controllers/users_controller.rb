class UsersController < ApplicationController
  def index
    # render plain: "I'm in the index action!"
    render json: User.all
  end
  
  def create
    # render json: params
    user = User.new(user_params)
    
    if user.save
      render json: user
    else 
      render json: user.errors.full_messages, status: :unprocessable_entity, error: 422
    end
  end
  
  def show
    user = User.find_by(id: params[:id])

    if user
      render json: user
    else
      render json: ['User not found'], status: :unprocessable_entity, error: 422
    end
  end
  
  def update
    user = User.find(params[:id])
    
    if user.update(user_params)
      render json: user 
    else 
      render json: user.errors.full_messages, status: 422
    end
  end
  
  def destroy
    user = User.find_by(id: params[:id])
    
    if user 
      user.destroy
      render json: ["User has been deleted"]
    else 
      render json: ['User not found'], status: :unprocessable_entity, error: 422
    end  
    
  end
  
  private 
  
  def user_params
    params[:user].permit(:username)
  end
  
    
end
