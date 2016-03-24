class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.has_one :address
      t.string :name null: false

      t.timestamps null: false
    end
  end
end
