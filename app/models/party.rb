class Party < ApplicationRecord
  has_many :messages, dependent: :destroy
  validates_presence_of :name, :phone_number
  validates_uniqueness_of :phone_number
  validates_with GoodnessValidator
  validates :phone_number, numericality: true
end
