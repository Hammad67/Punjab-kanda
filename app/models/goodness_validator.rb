class GoodnessValidator < ActiveModel::Validator
    def validate(record)
        if !record.phone_number.to_i.between?(923000000000, 923999999999) 
            record.errors.add :phone_number, "must be in 923026211613 format."
        end
    end
end