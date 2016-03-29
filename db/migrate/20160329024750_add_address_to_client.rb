class AddAddressToClient < ActiveRecord::Migration
  def change
    add_reference :clients, :address, index: true, foreign_key: true
  end
end
