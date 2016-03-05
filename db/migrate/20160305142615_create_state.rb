class CreateState < ActiveRecord::Migration
  def change
    create_table :states do |t|
      t.string :name
      t.string :abbreviation
      t.datetime :created_at
      t.datetime :updated_at
      t.datetime :deleted_at
    end
    add_index :states, :deleted_at
  end
end
