# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

user1 = User.create(name: 'Alishah')
user2 = User.create(name: 'Wilhelm')

Motorbike.create(
name:'new bike',
description: 'A new chapter opens in H-D’s longest running family, powered by the all-new Revolution® Max 1250T. To call it the ultimate Sportster® is an understatement. Prepare for a level of power and performance that has surpassed all expectations.',
price: 100,
photo: 'https://www.harleydavidsonsouthafrica.co.za/wp-content/uploads/2023/05/Sportster-s.jpg', 
finance_fee:10, 
total_amount_payable: 10,
duration: 12,
user_id: user1.id);

# motorbike2 = Motorbike.create(
#   name: 'Heritage Classic',
#   photo: 'https://www.harleydavidsonsouthafrica.co.za/wp-content/uploads/2021/10/5824c42fc21e74e804551c99_Harley-Davidson-Touring-Road-King-Rental.jpg',
#   description: 'The dark style, modern edge and reinvigorated ride of the Heritage model take nostalgia ripping into a new place.',
#   price: 2200,
#   finance_fee: 110,
#   total_amount_payable: 4300,
#   duration: 48,
#   user: user2,
# )

# motorbike3 = Motorbike.create(
#   name: 'Tri-Glide',
#   photo: 'https://www.harleydavidsonsouthafrica.co.za/wp-content/uploads/2021/10/Tri-Glide.jpg',
#   description: 'Get all the premium features, starting with a Twin-Cooled™ Milwaukee-Eight® 114 engine, the BOOM!™ Box GTS infotainment system and enough storage space so you can pack enough to go for a good, long time.',
#   price: 3500,
#   finance_fee: 110,
#   total_amount_payable: 8000,
#   duration: 48,
#   user: user1,
# )

# motorbike4 = Motorbike.create(
#   name: 'Low Rider S',
#   photo: 'https://www.harleydavidsonsouthafrica.co.za/wp-content/uploads/2021/02/5824c5a47cf1e22d0582f648_Harley-Davidson-883-Iron-Rental.jpg',
#   description: 'Low Rider™ S 117 model is an aggressive performance kingpin designed for the rider seeking unapologetic power, the rider willing to push their bike to the limit.',
#   price: 1800,
#   finance_fee: 110,
#   total_amount_payable: 3400,
#   duration: 48,
#   user: user2,
# )

# motorbike5 = Motorbike.create(
#   name: 'Heritage Classic',
#   photo: 'https://www.harleydavidsonsouthafrica.co.za/wp-content/uploads/2021/10/5824c42fc21e74e804551c99_Harley-Davidson-Touring-Road-King-Rental.jpg',
#   description: 'The dark style, modern edge and reinvigorated ride of the Heritage model take nostalgia ripping into a new place.',
#   price: 3100,
#   finance_fee: 110,
#   total_amount_payable: 5600,
#   duration: 48,
#   user: user1,
# )

# motorbike6 = Motorbike.create(
#   name: 'Pan American',
#   photo: 'https://www.harleydavidsonsouthafrica.co.za/wp-content/uploads/2021/10/Pan-America.jpg',
#   description: 'Pan American motorcycle is a two-wheel multi-tool built to endure, designed to explore, and engineered for adventure.',
#   price: 2500,
#   finance_fee: 110,
#   total_amount_payable: 4600,
#   duration: 48,
#   user: user2,
# )
