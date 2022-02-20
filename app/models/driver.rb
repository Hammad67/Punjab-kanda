class Driver < ApplicationRecord
  has_many :messages, dependent: :destroy
  validates_presence_of :name, :phone_number
  validates :phone_number, numericality: true
  validates_uniqueness_of :phone_number
  validates_with GoodnessValidator
end