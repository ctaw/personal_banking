class Admin::ClientTransactionsController < AdminController

  before_action :set_client_transaction_id, :only=> [:show, :edit, :update, :destroy]
  before_action :look_ups, :only => [:edit, :new, :update]

  def index
    @client_transactions = ClientTransaction.all
  end

  def new
    @client_transaction = ClientTransaction.new
  end

  def create
    @client_transaction = ClientTransaction.new(client_transaction_params)
    if @client_transaction.save
      redirect_to "/admin/client_transactions/#{@client_transaction.id}"
    else
      render :new
    end
  end

  def show
    # Computation
    @total_credit = Credit.where(:client_transaction_id => @client_transaction.id).sum(:amount)
    @total_debit = Debit.where(:client_transaction_id => @client_transaction.id).sum(:amount)

    @profit = (@total_credit.to_f - @total_debit.to_f)

    # Client Histories
    @client_credits = ClientTransaction.includes(:credits)
  end

  def edit
  end

  def update
    if @client_transaction.update(client_transaction_params)
      redirect_to "/admin/client_transactions/#{@client_transaction.id}", :notice => "Data was successfully updated!"
    else
      render :edit
    end
  end

  def destroy
    @client_transaction.destroy
    redirect_to action: :index
  end

  private

  def set_client_transaction_id
    @client_transaction = ClientTransaction.find(params[:id])
  end

  def look_ups
    @clients = Client.select("id, name").order("name ASC")
    @transaction_types = TransactionType.select("id, name").order("name ASC")
  end

  def client_transaction_params
    params.require(:client_transaction).permit(:client_name, :plate_number, :client_address, :client_contact_number, :transaction_date, :on_notification,
      credits_attributes: [:id, :transaction_id, :amount, :transaction_type_id, :note, :_destroy],
      debits_attributes: [:id, :transaction_id, :amount, :transaction_type_id, :note, :_destroy])
  end

end
