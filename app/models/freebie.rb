class Freebie < ActiveRecord::Base
    belongs_to :dev
    belongs_to :company

    def print_details
        if self.value == 1
            "#{dev.name} owns a #{item_name} from #{company.name}"
        elsif item_name[-1] == "s"
            "#{dev.name} owns #{value} #{item_name} from #{company.name}"
        else
            "#{dev.name} owns #{value} #{item_name}s from #{company.name}"
        end
    end
end
