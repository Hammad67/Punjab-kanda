json.extract! send_message, :id, :srial_number, :vehicle_number, :product, :weight_type, :first_weight, :second_weight, :net_weight, :cash, :party_id, :driver_id, :created_at, :updated_at
json.url send_message_url(send_message, format: :json)
