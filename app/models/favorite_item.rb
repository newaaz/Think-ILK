class FavoriteItem < ApplicationRecord
  belongs_to :favorite
  belongs_to :listing, polymorphic: true
end
