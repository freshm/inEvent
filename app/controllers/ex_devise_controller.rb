require 'securerandom'
class ExDeviseController < Devise::RegistrationsController
  def new
    super
  end

  def create
    build_resource(sign_up_params)
    resource.uid = SecureRandom.hex
    resource.provider = "inEvent"
    resource.save
    yield resource if block_given?
    if resource.persisted?
    if resource.active_for_authentication?
    set_flash_message :notice, :signed_up if is_flashing_format?
    sign_up(resource_name, resource)
    respond_with resource, location: after_sign_up_path_for(resource)
    else
    set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_flashing_format?
    expire_data_after_sign_in!
    respond_with resource, location: after_inactive_sign_up_path_for(resource)
    end
    else
    clean_up_passwords resource
    set_minimum_password_length
    respond_with resource
    end
  end

  def update
    #binding.pry

    if params[:user][:password].blank?
      params[:user].delete("password")
      params[:user].delete("password_confirmation")
    end

    @user = User.find(current_user.id)
    if @user.update_attributes(params.require(:user).permit(:firstname, :lastname, :gender, :birthday,:city,:zipcode, :interests, :avatar))# params[:user])
      set_flash_message :notice, :updated
      # Sign in the user bypassing validation in case his password changed
      sign_in @user, :bypass => true
      redirect_to user_show_path(@user)
    else
      render "edit"
    end
  end
  
  def title
  	""
  end
end 