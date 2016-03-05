class CreateAddress < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :line_1
      t.string :line_2
      t.string :city
      t.string :suburb
      t.string :postal_code
      t.belongs_to :state, index: true, foreign_key: true
      t.datetime :created_at
      t.datetime :updated_at
      t.datetime :deleted_at
    end
    add_index :addresses, :deleted_at
  end
end
