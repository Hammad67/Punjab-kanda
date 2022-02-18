class SendMessage < ApplicationRecord
  belongs_to :party, optional: true, dependent: :destroy
  belongs_to :driver, optional: true, dependent: :destroy
  validates_presence_of :before_load_weight
  validates_presence_of :after_load_weight

end
