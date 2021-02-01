class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      # t.references :user,                  null: false, foreign_key: true
      t.integer    :trading_status,        null: false, default: 0
      t.string     :name,                  null: false
      t.text       :introduction,          null: false
      t.integer    :category_id,           null: false
      t.integer    :condition_id,          null: false
      t.integer    :shipping_fee_payer_id, null: false
      t.integer    :prefecture_id,         null: false
      t.integer    :preparation_day_id,    null: false
      t.integer    :price,                 null: false
      t.timestamps

    end
  end
end
