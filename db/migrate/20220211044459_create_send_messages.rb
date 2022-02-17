class CreateSendMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :send_messages do |t|
      t.string :srial_number
      t.string :vehicle_number
      t.string :product
      t.string :weight_type
      t.integer :before_load_weight
      t.integer :after_load_weight
      t.integer :net_weight
      t.integer :cash
      t.references :party, null: true, foreign_key: true
      t.references :driver, null: true, foreign_key: true

      t.timestamps
    end
  end
end
