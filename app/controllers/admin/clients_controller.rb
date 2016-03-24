class Admin::ClientsController < Admin::BaseController
  before_action :set_client, only: [:edit, :update, :destroy]

  respond_to :html

  def index
    authorize(Client)
    @ransack_query = Client.ransack(params[:q])
    @clients = @ransack_query.result.page(params[:page])
  end

  def new
    @client = Client.new
    authorize(@client)
  end

  def edit
    authorize(@client)
  end

  def create
    @client = Client.new(client_params)
    authorize(@client)
    @client.save
    respond_with(@client, location: admin_clients_path)
  end

  def update
    authorize(@client)
    @client.update(client_params)
    respond_with(@client, location: admin_clients_path)
  end

  def destroy
    authorize(@client)
    @client.destroy
    redirect_to(admin_clients_path, notice: "'#{@client}' deleted")
  end

private

  def set_client
    @client = Client.find(params[:id])
  end

  def client_params
    params.require(:client).permit(:name)
  end

end
