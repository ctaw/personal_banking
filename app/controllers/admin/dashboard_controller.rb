class Admin::DashboardController < AdminController

  before_action :look_ups, :only => [:index, :edit, :new, :update]

	def index
    @credit_reminders = Credit.where(:reminders_date => DateTime.now.to_date).count
    @credits = Credit.select("id, customer_name, transaction_type_id, amount").order("id DESC").paginate(:page => params[:credits], :per_page => 5)
    @debits = Debit.select("id, customer_name, transaction_type_id, amount").order("id DESC").paginate(:page => params[:credits], :per_page => 5)
		@credit = Credit.new
    @debit = Debit.new
	end

  def search
    @credit_customers = Credit.search(params[:search]).order("id DESC").paginate(:page => params[:credit_customers], :per_page => 5)
    @debit_customers = Debit.search(params[:search]).order("id DESC").paginate(:page => params[:debit_customers], :per_page => 5)
  end

  def date_range
    @start_date = params[:start_date]
    @end_date = params[:end_date]

    @all_credit_customers = Credit.where(:transaction_date => @start_date.to_datetime.beginning_of_day..@end_date.to_datetime.end_of_day).order("id DESC").paginate(:page => params[:all_credit_customers], :per_page => 5)
    @all_debit_customers = Debit.where(:transaction_date => @start_date.to_datetime.beginning_of_day..@end_date.to_datetime.end_of_day).order("id DESC").paginate(:page => params[:all_debit_customers], :per_page => 5)
  end

	private

	def look_ups
		@transaction_types = TransactionType.select("id, name").order("name ASC")
	end

end
