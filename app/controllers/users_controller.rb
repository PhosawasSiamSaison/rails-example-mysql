class UsersController < ApplicationController
  def index
    users = User.all
    render json: {
      count: users.count,
      users:  users
    }
  end

  def show
    user = User.find_by(id: params[:id])
    render json: {
      user:  user
    }
  end

  def create
    user = User.new(register_user)
    if user.save
      render json: {
        success: true
      }
    else
      render json: {
        success: false,
        errors: user.error_messages
      }
    end
  end

  def update
    user = User.find_by(id: params[:id])
    unless user
      return render json: {
        success: false,
        errors: "not found"
      }
    end
    if user.update(register_user)
      render json: {
        success: true
      }
    else
      render json: {
        success: false,
        errors: user.error_messages
      }
    end
  end

  def destroy
    user = User.find_by(id: params[:id])
    if user.delete
      render json: {
        success: true
      }
    else
      render json: {
        success: false,
        errors: user.error_messages
      }
    end
  end

  private
  def register_user
    params.require(:user).permit(
      :user_name,
    )
  end
end
