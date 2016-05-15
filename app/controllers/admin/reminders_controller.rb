class Admin::RemindersController < AdminController

	def index
		@credit_reminders = Credit.where(:reminders_date => DateTime.now.to_date)
	end

end
