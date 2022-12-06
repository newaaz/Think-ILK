class Room < ApplicationRecord
  belongs_to :property

  has_many :prices, dependent: :destroy

  validates :title, :guest_base_count, :guest_max_count, presence: true

  accepts_nested_attributes_for :prices, reject_if: :all_blank, allow_destroy: true
end
