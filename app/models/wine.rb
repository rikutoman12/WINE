class Wine < ApplicationRecord
  attachment :image
def self.search(keyword)
  where(["winename like? OR age like? OR origin like? OR kinds like?", "%#{keyword}%", "%#{keyword}%", "%#{keyword}%", "%#{keyword}%"])
end
end
