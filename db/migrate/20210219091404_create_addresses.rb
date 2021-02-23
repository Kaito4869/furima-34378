class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :zip_code, null: false
      t.integer :area_id, null: false
      t.string :city, null: false
      t.string :address, null: false
      t.string :building_name
      t.string :telephone_number, null: false
      t.references :order, foreign_key: true, null: false
      t.timestamps
    end
  end
end
