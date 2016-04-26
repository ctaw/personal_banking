class Admin::DashboardController < AdminController
	
	def index
		@users = User.select("id, email").order("id DESC")
	end

end
