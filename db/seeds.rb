# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(
   email: 'test@test.com',
   password: 'hibiki'
)

users = User.create!(
  [
    {email: 'hanako@test.com', last_name: '山田', first_name: '花子', last_name_kana: 'ヤマダ', first_name_kana: 'ハナコ', telephone_number: '00000000000', password: 'password', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user1.jpg"), filename:"sample-user1.jpg")},
    {email: 'miyako@test.com', last_name: '沖縄', first_name: '都', last_name_kana: 'オキナワ', first_name_kana: 'ミヤコ', telephone_number: '00000000000', password: 'password', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user2.jpg"), filename:"sample-user2.jpg")},
    {email: 'ken@test.com', last_name: '山口', first_name: 'けん', last_name_kana: 'ヤマグチ', first_name_kana: 'ケン', telephone_number: '00000000000', password: 'password', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user3.jpg"), filename:"sample-user3.jpg")}
  ]
)

PostImage.create!(
  [
    {title: 'マカロン', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post1.jpg"), filename:"sample-post1.jpg"), caption: 'バラを練り込んだマカロンです！', user_id: users[0].id },
    {title: '結婚式', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post2.jpg"), filename:"sample-post2.jpg"), caption: '素敵な花輪とブーケ作ってもらった！', user_id: users[1].id },
    {title: 'プレゼント', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post3.jpg"), filename:"sample-post3.jpg"), caption: 'プレゼント貰って嬉しい！', user_id: users[2].id }
  ]
)

Item.create!(
  [
    {name: '紫陽花', price: '500', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-item1.jpg"), filename:"sample-item1.jpg"), introduction: '紫陽花のドライフラワーです'},
    {name: 'リース', price: '1000', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-item2.jpg"), filename:"sample-item2.jpg"), introduction: '文字は変更できます'},
    {name: 'ブーケ', price: '500', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-item3.jpg"), filename:"sample-item3.jpg"), introduction: '小さいサイズのブーケです'}
  ]
)