class Company < ActiveRecord::Base
    has_many :freebies
    has_many :devs, through: :freebies

    def give_freebie(dev, item_name, value)
        freebie_new = Freebie.new(item_name: item_name, value: value, dev_id: dev.id, company_id: self.id)
        freebie_new.save
    end

    def self.oldest_company
        self.order(:founding_year).first
    end
end
