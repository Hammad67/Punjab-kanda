class Message < ApplicationRecord
  belongs_to :party
  belongs_to :driver
end
