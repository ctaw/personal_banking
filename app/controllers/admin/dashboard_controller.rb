class Admin::DashboardController < AdminController

	def index
		@users = User.select("id, email").order("id DESC").paginate(:page => params[:users], :per_page => 5)
		@transaction_types = TransactionType.select("id, name").order("name ASC").paginate(:page => params[:transaction_types], :per_page => 5)
	end

end
