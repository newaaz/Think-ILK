class Service < ApplicationRecord
  SERVICE_CATEGORIES =  ["Доставка еды", "Такси", "Спортзалы", "Прокат авто", "Велопрокат","Эвакуатор", "Прачечные",
                         "Ремонт обуви", "Теннис", "Другое",
                         "Массаж", "Бильярд", "Бани / Сауны", "Красота", "Ремонт телефонов", "Частные клиники", "Детские комнаты"].freeze

  include CarrierwaveImagable
  include Geolocable
  include ListingActivatable
  include Contactable
  include AdditionalFieldable
  include Favoritable
  include Ratingable

  has_and_belongs_to_many :towns

  belongs_to :owner, class_name: 'Partner'

  validates :title, :category_title, :description, :towns, presence: true
  validates :category_title, inclusion: { in: SERVICE_CATEGORIES }
end
