class Dev < ActiveRecord::Base
    has_many :freebies
    has_many :companies, through: :freebies

    def received_one?(item_name)
        freebies.any?{|freebie| freebie.item_name.upcase == item_name.upcase}
    end

    def give_away(dev, freebie)
        if freebies.include?(freebie)
            freebie.update_attribute(:dev, dev)
        else
            "I don't have that #{freebie.item_name}, ask #{freebie.dev.name}."
        end
    end
end
