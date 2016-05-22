class Admin::DebitsController < AdminController

  before_action :look_ups, :only => [:edit, :update]
  before_action :set_debit_id, :only=> [:show, :edit, :update, :destroy]

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

  def edit
  end

  def update
    if @debit.update(debit_params)
      redirect_to "/admin/dashboard?update=updated"
    else
      render :edit
    end
  end

  def show
  end

  def destroy
    @debit.destroy
    redirect_to "/admin/dashboard?update=success"
  end

  private

  def look_ups
		@transaction_types = TransactionType.select("id, name").order("name ASC")
	end

  def set_debit_id
    @debit = Debit.find(params[:id])
  end

  def debit_params
		params.require(:debit).permit(:transaction_date, :customer_name, :contact_number, :plate_number,
																	 :transaction_type, :description, :amount, :reminders_date, :reminders_message)
	end

end
