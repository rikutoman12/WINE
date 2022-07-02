class Wine < ApplicationRecord
  attachment :image
def self.search(keyword)
  where(["winename like? OR age like? OR origin like? OR kinds like?", "%#{keyword}%", "%#{keyword}%", "%#{keyword}%", "%#{keyword}%"])
end

    scope :latest, -> {order(created_at: :desc)}
    scope :old, -> {order(created_at: :asc)}
    scope :rate_count, -> {order(rate: :desc)}
end
