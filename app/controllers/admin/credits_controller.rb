class Admin::CreditsController < AdminController

  before_action :look_ups, :only => [:edit, :update]
  before_action :set_credit_id, :only=> [:show, :edit, :update, :destroy]

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

  def edit
  end

  def update
    if @credit.update(credit_params)
      redirect_to "/admin/dashboard?update=updated"
    else
      render :edit
    end
  end

  def show
  end

  def destroy
    @credit.destroy
    redirect_to "/admin/dashboard?update=success"
  end

  private

  def look_ups
		@transaction_types = TransactionType.select("id, name").order("name ASC")
	end

  def set_credit_id
    @credit = Credit.find(params[:id])
  end

  def credit_params
		params.require(:credit).permit(:transaction_date, :customer_name, :contact_number, :plate_number,
																	 :transaction_type, :description, :amount, :reminders_date, :reminders_message)
	end

end
