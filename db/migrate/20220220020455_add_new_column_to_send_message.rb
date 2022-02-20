class AddNewColumnToSendMessage < ActiveRecord::Migration[6.1]
  def change
    add_column :send_messages, :phone_number, :string
  end
end
