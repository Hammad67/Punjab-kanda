class SendMessage < ApplicationRecord
  belongs_to :party, optional: true
  belongs_to :driver, optional: true
  validates_presence_of :before_load_weight, :after_load_weight, :vehicle_number, :weight_type, :cash
  enum weight_type: { kg: "kg", pond: "pond" }
  before_save :update_net_weight
  validates_with GoodnessValidator, :if => Proc.new{|f| f.phone_number.present? } 
  validates :phone_number, numericality: true, :if => Proc.new{|f| f.phone_number.present? } 

  def update_net_weight
    self.write_attribute(:net_weight, (self.after_load_weight.to_i - self.before_load_weight.to_i))
  end
  
end