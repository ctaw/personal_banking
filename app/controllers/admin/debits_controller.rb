class Admin::DebitsController < AdminController

  def index
  end

  def create
    @debit = Debit.new(debit_params)
    respond_to do |format|
			if @debit.save
				format.js { render :action => "success" }
			else
				format.js { render :action => "error" }
			end
		end
  end

  private

  def debit_params
		params.require(:debit).permit(:transaction_date, :customer_name, :contact_number, :plate_number,
																	 :transaction_type_id, :description, :amount, :reminders_date, :reminders_message)
	end

end
