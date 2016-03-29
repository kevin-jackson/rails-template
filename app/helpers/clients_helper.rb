module ClientsHelper
  
  def setup_client(client)
    client.address ||= Address.new
    client
  end
  
end
