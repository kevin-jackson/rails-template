class Admin::ClientsController < Admin::BaseController
  before_action :set_client, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    authorize(User)
    @clients = Client.all
    #respond_with(@clients)
  end

  def show
    respond_with(@client)
  end

  def new
    authorize(User)
    @client = Client.new
    #respond_with(@client)
  end

  def edit
  end

  def create
    @client = Client.new(client_params)
    authorize(User)
    @client.save
    respond_with(@client, location: admin_clients_path)
  end

  def update
    @client.update(client_params)
    respond_with(@client)
  end

  def destroy
    @client.destroy
    respond_with(@client)
  end

  private
    def set_client
      @client = Client.find(params[:id])
    end

    def client_params
      params.require(:client).permit(:name)
    end
end
