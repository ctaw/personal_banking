class Admin::DashboardController < AdminController

  before_action :look_ups, :only => [:index, :edit, :new, :update]

	def index
    @credits = Credit.select("id, customer_name, transaction_type_id, amount").order("id DESC").paginate(:page => params[:credits], :per_page => 5)
    @debits = Debit.select("id, customer_name, transaction_type_id, amount").order("id DESC").paginate(:page => params[:credits], :per_page => 5)
		@credit = Credit.new
    @debit = Debit.new
	end

	private

	def look_ups
		@transaction_types = TransactionType.select("id, name").order("name ASC")
	end

end
