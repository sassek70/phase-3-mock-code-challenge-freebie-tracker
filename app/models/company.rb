class Company < ActiveRecord::Base
    has_many :freebies
    has_many :devs, through: :freebies

    def give_freebie(dev)
        freebie_new = Freebie.new(item_name: "Card Deck", value: "30", dev_id: dev.id, company_id: self.id)
        freebie_new.save
    end

    def self.oldest_company
        self.order(:founding_year).first
    end
end
