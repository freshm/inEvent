class UsersController < ApplicationController
	def index
	end

	def show
		@user = User.find(params[:id])
	end

	def update
	end

	def edit
	end

	def destroy
	end
  
    def privatise
      #binding.pry
      user = User.find(params[:current_user])
      field = params[:field]
      
      if field == "firstname"
        user.firstname_private = !user.firstname_private
      elsif field == "lastname"
        user.lastname_private = !user.lastname_private
      elsif field == "city"
        user.city_private = !user.city_private
      elsif field == "zipcode"
        user.zipcode_private = !user.zipcode_private
      elsif field == "birthday"
        user.birthday_private = !user.birthday_private
      elsif field == "gender"
        user.gender_private = !user.gender_private
      elsif field == "interests"
        user.interests_private = !user.interests_private
      else
      end
      # binding.pry
      user.save
    end

  helper_method :title
  private

  def title
  	"Benutzer"
  end
end