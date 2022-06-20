class DeliveryDay < ActiveHash::Base
  self.data = [
    { id: 1, delivery_day: '---' },
    { id: 2, delivery_day: '1~2日で配送' },
    { id: 3, delivery_day: '2~3日で配送' },
    { id: 4, delivery_day: '4~7日で配送' }
  ]

  include ActiveHash::Associations
  has_many :items
end