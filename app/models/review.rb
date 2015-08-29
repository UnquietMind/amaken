class Review < ActiveRecord::Base
    belongs_to :user
    belongs_to :place
    
    validates_presence_of :content
    validates_presence_of :score
    
    after_save :calcualte_average
    
    def calcualte_average
        a = self.place.average_rating
        self.place.update_attributes(total_average_rating: a)
    end
end
