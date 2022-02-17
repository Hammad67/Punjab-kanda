class SendMessage < ApplicationRecord
  belongs_to :party ,optional: true
  belongs_to :driver, optional: true

end
