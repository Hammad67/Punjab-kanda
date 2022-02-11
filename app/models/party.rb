class Party < ApplicationRecord
    has_many :messages, dependent: :destroy
end
