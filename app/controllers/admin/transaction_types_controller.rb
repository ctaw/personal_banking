class Admin::TransactionTypesController < AdminController

	before_action :set_transaction_type_id, :only=> [:show, :edit, :update, :destroy]

	def index
		@transaction_types = TransactionType.select("id, name, description").order("name ASC")
	end

  def new
		@transaction_type = TransactionType.new
  end

  def create
		@transaction_type = TransactionType.new(transaction_type_params)
    if @transaction_type.save
      redirect_to "/admin/transaction_types"
    else
      render :new
    end
  end

	def show
	end

	def edit
	end

	def update
		if @transaction_type.update(transaction_type_params)
      redirect_to "/admin/transaction_types"
    else
      render :edit
    end
	end

	def destroy
		@transaction_type.destroy
    redirect_to action: :index
	end

  private

  def set_transaction_type_id
		@transaction_type = TransactionType.find(params[:id])
  end

  def transaction_type_params
		params.require(:transaction_type).permit(:name, :description)
  end

end
