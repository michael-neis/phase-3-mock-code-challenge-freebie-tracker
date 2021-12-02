require "pry"

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

    def self.most_freebies
        devs = self.all.map{|free| free.dev_id}
        total_frees = devs.count(devs.max_by{|dev| devs.count(dev)})
        collectors = Dev.all.filter{|dev| dev.freebies.length == total_frees}.map{|dev| dev.name}

        if collectors.length > 1
            "#{collectors.join(" and ")} are tied for most freebies with #{total_frees} total freebies!"
        else 
            "#{collectors[0]} has the most freebies with #{total_frees} total freebies!"
        end
    end
end
