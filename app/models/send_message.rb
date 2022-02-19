class SendMessage < ApplicationRecord
  belongs_to :party, optional: true
  belongs_to :driver, optional: true
  validates_presence_of :before_load_weight, :after_load_weight, :vehicle_number, :weight_type, :cash
  enum weight_type: { KG: "KG", POUND: "POUND" }
  after_save :find_number

  def net_weight=(net_weight)
    write_attribute(:net_weight, (self.after_load_weight.to_i - self.before_load_weight.to_i))
  end

  def find_number
     if self.party_id.present?
      send_message_to_number( self.party.number)
     elsif self.driver_id.present?
      send_message_to_number( self.driver.number)
     end
  end

  def send_message_to_number(number)
    message="Vehicle number: #{self.vehicle_number}
    Product: #{self.product}
    First Load Weight:  #{self.before_load_weight}
    Second Load Weight:  #{self.after_load_weight}
    Net Load Weight:  #{self.net_weight}
    Total Amoount:  #{self.cash}"
    # api_keys=ENV["api_key"]
    #response= Faraday.post("https://sendpk.com/api/sms.php?api_key=#{api_keys}&sender=BrandName&mobile=#{phone_number}&message=#{message}")
  end
end