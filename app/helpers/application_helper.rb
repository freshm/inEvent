module ApplicationHelper
	def render_subtitle
		string = "- "
		if params[:controller] == "devise/sessions"
			string = string + "Anmelden"
		elsif params[:controller] == "ex_devise"
			string = string + "Registrieren"
		else
			string = !title.empty? ? string + title : ""
		end

		string
	end
end
