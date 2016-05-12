class Admin::CreditsController < AdminController

  def index
  end

  def create
    @credit = Credit.new(credit_params)
    respond_to do |format|
			if @credit.save
				format.js { render :action => "success" }
			else
				format.js { render :action => "error" }
			end
		end
  end

  private

  def credit_params
		params.require(:credit).permit(:transaction_date, :customer_name, :contact_number, :plate_number,
																	 :transaction_type_id, :description, :amount, :reminders_date, :reminders_message)
	end

end
