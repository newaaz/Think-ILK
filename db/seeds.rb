PROPERTY_NAMES = ["Гостевой дом 'Одиссей'", "Гостевой дом 'Александра'", "Гостиница 'Орхидея'",
                  "Апартаменты 'Парус'", "Эллинг 'Катран'", "Дом под ключ в центре",
                  "3-х комнатная квартира у моря", "Гостиница У Моря", "Эко гостевой дом 'Здоровье'",
                  "Отель 'Бриз'", "Апартаменты 'Хижина Робинзона'", "Вилла 'Santa Fe'", "Апартаменты 'На Черноморской'"].freeze

PROPERTY_ADRESSES = ["ул. Ленина 15", "Черноморская набережная, д. 1В", "ул. Бусина 35", "ул. Приморская 65 B",
                     "переулок Лазурный, д.7", "ул. Луначарского, д. 16", "Севастопольское шоссе, д. 22", "ул. Ленина, 35 б,
                     эллинг 60"].freeze

# Categories for properties
def create_categories
  Category.destroy_all
  Category.create!([
    { title: 'Гостевые дома', ordinal_number: 1 },
    { title: 'Гостиницы', ordinal_number: 2 },
    { title: 'Квартиры', ordinal_number: 3 },
    { title: 'Частный сектор', ordinal_number: 4 },
    { title: 'Дома под ключ', ordinal_number: 5 },
    { title: 'Эллинги', ordinal_number: 6 }
  ])
  puts "Categories created"
end

# Towns
def create_towns
  Town.destroy_all
  Town.create!([
    {
      name: 'Феодосия', parent_name: 'Феодосии', ordinal_number: 1,
      description: "Это замечательный курортный город в Крыму, который неизменно пользуется популярностью у отдыхающих. Туристам и отдыхающим есть на что посмотреть - это и музеи, и живописные парки, и песчаные и галечные пляжи, и древние памятники архитектуры",
      avatar: File.open(File.join(Rails.root, "app/assets/images/towns_avatars/avatar_feo.jpg"))
    },
    {
      name: 'Коктебель', parent_name: 'Коктебеле', ordinal_number: -2,
      description: "В переводе это слово означает 'край голубых холмов'. Здесь жил и творил Волошин, здесь проходит Джаз-Фестиваль. Творческие натуры чувствуют себя здесь свободно и комфортно",
      avatar: File.open(File.join(Rails.root, "app/assets/images/towns_avatars/avatar_koktebel.jpg"))
    },
    {
      name: 'Приморский', parent_name: 'Приморском', ordinal_number: 3,
      description: "Расположен на берегу Феодосийского залива в 14 километрах от Феодосии. Жильё для отдыха в посёлке самое разнообразное. Именно поэтому этот небольшой посёлок часто выбирают для отдыха в Крыму люди с самым разным достатком. Есть школа виндсёрфинга",
      avatar: File.open(File.join(Rails.root, "app/assets/images/towns_avatars/avatar_primorskiy.jpg"))
    },
    {
      name: 'Орджоникидзе', parent_name: 'Орджоникидзе', ordinal_number: -1,
      description: "Посёлок расположен на берегу бухты, с трёх сторон омывается морем. Вокруг - горы, холмы и голубая бездна моря. Здесь очень чистая вода. Этот факт очень важен, так как в этот укромный уголок Крыма приезжают на отдых чаще всего родители с детьми. Цена на отдых в Орджоникидзе ниже, чем в соседних городах и посёлках",
      avatar: File.open(File.join(Rails.root, "app/assets/images/towns_avatars/avatar_orjo.jpg"))
    },
    {
      name: 'Береговое', parent_name: 'Береговом', ordinal_number: 2,
      description: "Это небольшой посёлок, рядом с Феодосией. Население здесь всего несколько тысяч, а ритм жизни - неторопливый и размеренный, как крымское лето",
      avatar: File.open(File.join(Rails.root, "app/assets/images/towns_avatars/avatar_beregovoe.jpg"))
    }
  ])
  puts "Towns created"
end

def rand_image_path  
  Pathname.new(Rails.root.join("app/assets/images/seed/property/p (#{rand 1..15}).jpg"))
end

def rand_price
  (rand(1000..2500) / 50).round * 50
end

# Create property
def create_property
  property = Property.new(title:        PROPERTY_NAMES.sample,
                          address:      PROPERTY_ADRESSES.sample,
                          town:         Town.all.sample,
                          category:     Category.all.sample,
                          owner:        Partner.first,
                          activated:    true,
                          price_from:   rand(1000..5000),
                          distance_to_sea: (rand(200..1500) / 50).round * 50,
                          services: ["kitchen", "excursions", "pool", "parking", "playground"],
                          geolocation:  Geolocation.new(
                            latitude: "45.0#{rand 60..80}65",
                            longitude: "35.3#{rand 60..80}88"),
                          contact:      Contact.new(
                            phone_number: '+7(978)117-54-21',                      
                            name: 'Мария Ивановна',
                            messengers: ["whatsapp", "viber", "telegram"]),
                          property_detail: PropertyDetail.new(
                            short_description: "Гостиница находится в одном из лучших районов города. До моря идти 7-10 минут неспешным шагом, направится можно на два разных пляжа. Первый пляж 'Динамо' - песчанный с ровным песчанным дном. Второй из мелкой перетёртой ракушки - пляж санатория Восход. Вход на все пляжи Феодосии бесплатный. В гостинице сдаются 2-х, 3-х и 4-х местные номера класса Люкс. В номерах имеется всё что нужно для комфортного отдыха в Феодосии. А именно: кровати, телевизор, кондиционер, шкаф, сан.узел, кухонка с микроволновой печью, холодильником, раковиной, посудой и кухонной мебелью. Во дворе гостиницы бассейн, декоративный водоём с рыбками, цветы, ландшафтный дизайн, декоративные растения, беседка, виноградник - очень красиво. У номеров на втором этаже есть общий балкон со столиками у номеров.",
                            food: 'оборудованная кухня, возможность готовить еду самостоятельно 2 кухни',
                            parking: 'бесплатная, на территории',
                            territory: 'закрытый двор терраса, место для отдыха мангал, место для барбекю',
                            transfer: 'трансфер из аэропорта в Симферополе 2500 руб',
                            amenities: ["washer", "closed_yard", "terrace", "brazier", "printer", "notebok"],
                            additional_info: 'Услуги за отдельную плату: пользование стиральной машиной. Примечание: если клиент отказывается от бронирования, предоплата не возвращается.',
                            site: 'ilovekrim.ru',
                            email: 'email@hotels.ru',
                            vk_group: 'i_lovekrim'))
  
  property.avatar.attach(io: rand_image_path .open, filename: "avatar.jpg")
  5.times do |i|
    property.images.attach(io: rand_image_path .open, filename: "p_#{i + 1}.jpg")
  end    
  
  # Create Room's
  3.times do |i|
    room = property.rooms.build(title: "Стандартный #{i + 1}-х местный номер",
                                guest_base_count: 2,
                                guest_max_count: rand(1..10),
                                rooms_count: 1,
                                size:   rand(20..50),
                                description: "Номера «люкс» подойдут для размещения четырех человек – отличный вариант для большой семьи",
                                services: ["sea_view", "mountain_view", "balcony", "tv", "satellite"],
                                bathroom: "Туалет и душ в номере, санузел совмещенный",
                                beds: "2 кровати",
                                furniture: "шкаф тумбочки",
                                in_room: "полный комплект посуды, посудомоечная машина, стиральная машина-автомат",
                                prices: [                                  
                                  Price.new(start_date: '01/03/2023', end_date: '31/03/2023', day_cost: rand_price),
                                  Price.new(start_date: '01/04/2023', end_date: '30/04/2023', day_cost: rand_price),
                                  Price.new(start_date: '01/05/2023', end_date: '31/05/2023', day_cost: rand_price),
                                  Price.new(start_date: '01/06/2023', end_date: '30/09/2023', day_cost: rand_price),
                                ])
  
    room.avatar.attach(io: rand_image_path .open, filename: 'r(1).jpg')
    6.times do |i|
      room.images.attach(io: rand_image_path .open, filename: "r_#{i + 1}.jpg")
    end    
  end

  property.save!
  puts "Property #{property.title} created"
end

Partner.destroy_all
Partner.create!(email: 'test@test.ru', name: 'Лидия Ивановна', password: '123456', confirmed_at: Time.zone.now)

time = Benchmark.measure do
  create_categories
  create_towns

  Property.destroy_all
  35.times { create_property }
  Property.reindex
  puts "Properties indexed"
end

puts "Время выполнения: #{time.real} секунд"
