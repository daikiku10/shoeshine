class CreateShops < ActiveRecord::Migration[6.0]
  def change
    create_table :shops do |t|
      t.string :address,      null:false
      t.string :instagram,    null:false
      t.string :phone_number, null:false
      t.float :lat,          null:false
      t.float :lng,          null:false
      t.references :user,     null:false, foreign_key: true
      t.timestamps
    end
  end
end
