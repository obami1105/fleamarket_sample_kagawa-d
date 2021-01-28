class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.references :seller,                null: false, foreign_key: {to_table: :users}
      t.references :buyer,                              foreign_key: {to_table: :users}
      t.integer    :trading_status,        null: false
      t.string     :name,                  null: false
      t.text       :introduction,          null: false
      t.references :category,              null: false, foreign_key: true
      t.integer    :item_condition_id,     null: false
      t.integer    :shipping_fee_payer_id, null: false
      t.integer    :prefecture_id,         null: false
      t.integer    :preparation_day_id,    null: false
      t.integer    :preparation_day_id,    null: false
      t.timestamps

      

    end
  end
end
