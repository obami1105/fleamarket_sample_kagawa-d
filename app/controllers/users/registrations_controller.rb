# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(sign_up_params)
    unless @user.valid?
      render :new and return
    end
    session["devise.regist_data"] = {user: @user.attributes}
    session["devise.regist_data"][:user]["password"] = params[:user][:password]
    @destination = @user.build_destination
    render :new_destination
  end

  def create_destination
    @user = User.new(session["devise.regist_data"]["user"])
    @destination = Destination.new(destination_params)
    unless @destination.valid?
      render :new_destination and return
    end
    @user.build_destination(@destination.attributes)
    @user.save
    session["devise.regist_data"]["user"].clear
    sign_in(:user, @user)
  end

  protected

  def destination_params
    params.require(:destination).permit(:post_code, :prefecture_id, :city, :house_number, :building_name, :phone_number)
  end

end
