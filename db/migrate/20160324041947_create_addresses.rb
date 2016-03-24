class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.belongs_to :client
      t.string :line_1, null: false, limit: 200
      t.string :line_2, limit: 200
      t.string :suburb, limit: 100
      t.string :city, null: false, limit: 100
      t.string :state, null: false, limit: 100
      t.string :post_code, null: false, limit: 10

      t.timestamps null: false
    end
  end
end
