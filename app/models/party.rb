class Party < ApplicationRecord
    has_many :messages
    validates_format_of :phone_number, :with =>  /\d[0-9]\)*\z/ , :message => "Only positive number without spaces are allowed"
    validates :phone_number, length: { is: 11}

end
