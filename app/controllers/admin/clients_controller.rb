class Admin::ClientsController < AdminController

	before_action :set_client_id, :only=> [:show, :edit, :update, :destroy]

	def index
		@clients = Client.select("id, client_code, name, plate_number").order("id ASC")
	end

  def new
		@client = Client.new
  end

  def create
		@client = Client.new(client_params)
    if @client.save
      redirect_to "/admin/clients"
    else
      render :new
    end
  end

	def show
	end

	def edit
	end

	def update
		if @client.update(client_params)
      redirect_to "/admin/clients"
    else
      render :edit
    end
	end

	def destroy
		@client.destroy
    redirect_to action: :index
	end

  private

  def set_client_id
		@client = Client.find(params[:id])
  end

  def client_params
		params.require(:client).permit(:client_code, :status, :name, :address, :contact_number, :plate_number)
  end
end
