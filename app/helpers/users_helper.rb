module UsersHelper
	def display_name
		(current_user == @user) ? "Mein Profil (#{@user.fullname})" : @user.fullname
	end

	def display_gender
		return "Unbekannt" if @user.gender.blank?
        @user.gender == "male" ? "Männlich" : "Weiblich"
	end
  
    def display_age
		@user.birthday.blank? ? "Unbekannt" : age(@user.birthday)
	end
  
    def display_city
      @user.city.blank? ? "Unbekannt" : "#{@user.city} #{@user.zipcode}"  
    end
  
    def display_interests
      @user.interests.blank? ? "Keine Angaben" : @user.interests  
    end
  
    private
    def age(date)
      now = Time.now.utc.to_date
      now.year - date.year - (date.to_date.change(:year => now.year) > now ? 1 : 0)
    end
end