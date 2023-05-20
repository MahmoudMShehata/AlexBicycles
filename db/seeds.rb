User.create!(email: "user@alex.com", password: 123456)

b1 = Bicycle.create!(model: "Keysto 007 Mountain Bicycle", style: "off-road",
                     price: "199.99", color: "cyan",
                     description: "This bicycle is awesome for mountain and jungle rides. Tires are always tight and they never blow!")
b1.image.attach(
      io:  File.open(File.join(Rails.root,'app/assets/images/offroad.jpg')),
      filename: 'offroad.jpg'
    )

b2 = Bicycle.create!(model: "Mountain Electric Bike Folding Electric Bicycle", style: "electric-bike",
                     price: "269.99", color: "black",
                     description: "The bicycle that gives the ultimate ease in riding while it makes the physical cycling work done!")
b2.image.attach(
      io:  File.open(File.join(Rails.root,'app/assets/images/electric_bike.jpg')),
      filename: 'electric_bike.jpg'
    )

b3 = Bicycle.create!(model: "VLRA BIKE children bicycle", style: "kids-bike",
                     price: "99.99", color: "pink",
                     description: "Looking for a nice gift for your kid? This bicycle is the just the thing for her as it comes with beautiful pinky-girly colors!")
b3.image.attach(
      io:  File.open(File.join(Rails.root,'app/assets/images/kids_bike.jpg')),
      filename: 'kids_bike.jpg'
    )

b4 = Bicycle.create!(model: "Kitty Bicycle", style: "kitty",
                     price: "199", color: "white",
               description: "The most adorable bike you'll ever have!")
b4.image.attach(
      io:  File.open(File.join(Rails.root,'app/assets/images/kitty.png')),
      filename: 'kitty.png'
    )

AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?