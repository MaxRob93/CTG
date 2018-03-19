class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.string :order_time
      t.string :pickup_time
      t.string :email

      t.timestamps
    end
  end
end
