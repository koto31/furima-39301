class CreateShares < ActiveRecord::Migration[6.0]
  def change
    create_table :shares do |t|
      t.string     :postal_code,        null: false
      t.integer    :item_prefecture_id, null: false
      t.string     :city,               null: false
      t.string     :addresses,          null:false
      t.string     :building
      t.string     :phone_number,       null: false
      t.references :orders,             foreign_key: true
      t.timestamps
    end
  end
end
