class Room < ApplicationRecord
  belongs_to :user
    has_many :reservations
    has_one_attached :room_image
    def self.search(keyword)
        where(["address like? OR room_name like? OR introduction like?","%#{keyword}%", "%#{keyword}%", "%#{keyword}%"])
    end
    def self.search(area)
        where(["address like?", "%#{area}%"])
    end
end
