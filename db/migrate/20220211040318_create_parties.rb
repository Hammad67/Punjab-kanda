class CreateParties < ActiveRecord::Migration[6.1]
  def change
    create_table :parties do |t|
      t.string :name
      t.string :phone_number
      t.string :address
      t.timestamps
    end
  end
end
