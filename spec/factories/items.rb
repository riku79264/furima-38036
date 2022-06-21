FactoryBot.define do
  factory :item do
    name {Faker::Lorem.sentence}
    explain {Faker::Lorem.sentence}
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'public/image/output-image1.png'))}
    category_id           {2}
    status_id             {2}
    postage_id            {2}
    shipping_area_id      {2}
    delivery_day_id       {2}
    price                 {3000}      
    association :user    
  end
end
