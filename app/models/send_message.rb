class SendMessage < ApplicationRecord
  belongs_to :party, optional: true
  belongs_to :driver, optional: true
  validates_presence_of :before_load_weight, :after_load_weight, :vehicle_number, :weight_type, :cash
  enum weight_type: { kg: "kg", pond: "pond" }
  before_save :update_net_weight
  after_save :find_number
  validates_with GoodnessValidator, :if => Proc.new{|f| f.phone_number.present? } 
  validates :phone_number, numericality: true, :if => Proc.new{|f| f.phone_number.present? } 

  def update_net_weight
    self.write_attribute(:net_weight, (self.after_load_weight.to_i - self.before_load_weight.to_i))
  end

  def find_number
     if self.party_id.present?
      send_message_to_number( self.party.phone_number)
     elsif self.driver_id.present?
      send_message_to_number( self.driver.phone_number)
    elsif self.phone_number.present?
      send_message_to_number( self.phone_number)
     end
  end

  def send_message_to_number(phone_number)
    message="
    Vehicle number: #{self.vehicle_number}
    Product: #{self.product}
    First Load Weight:  #{self.before_load_weight}
    Second Load Weight:  #{self.after_load_weight}
    Net Load Weight:  #{self.net_weight}
    Total Amoount:  #{self.cash}"
    api_key = ENV["API_KEY"]
    brand_name = ENV["BRAND_NAME"]
    response= Faraday.post("https://sendpk.com/api/sms.php?api_key=#{api_key}&sender=#{brand_name}&mobile=#{phone_number}&message=#{message}")
  end
end