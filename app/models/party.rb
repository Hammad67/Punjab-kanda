class Party < ApplicationRecord
  has_many :messages
  validates_format_of :phone_number,
                      :with => /(92)?(2)([0-9]{10})/,
                      :message => "Phone numbers must be in 923026255627 format."
  validates_presence_of :name
  validates_presence_of :phone_number


end
