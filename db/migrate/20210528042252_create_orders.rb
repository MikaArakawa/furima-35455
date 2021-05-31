class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.integer    :price,   null: false, index: true
      t.references :user,    null: false, foreign_key: true
      t.references :item,    null: false, foreign_key: true
      t.timestamps
    end
  end
end
