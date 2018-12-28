ListingsWatchlist.destroy_all
Watchlist.destroy_all
Listing.destroy_all
User.destroy_all

u1 = User.new
u1.id = 1
u1.username = "potato"
u1.email = "hot@potato.com"
u1.password = 'pudding'
u1.is_active = true
u1.save

u2 = User.new
u2.id = 2
u2.username = "test"
u2.email = "test@test.com"
u2.password = 'pudding'
u2.is_active = true
u2.save

w1 = Watchlist.new
w1.user_id = 1
w1.save

w2 = Watchlist.new
w2.user_id = 2
w2.save

l1 = Listing.new
l1.id = 1
l1.start_price = 10000
l1.start_time = Time.now.in_time_zone("Melbourne") + 10
l1.end_time = l1.start_time + 1800
l1.image_url ='https://media.apnarm.net.au/media/images/2018/02/08/b881216460z1_20180208142445_000gn2vi15p2-0-w60xy9pvrimv36klqp2_fct588x441_ct300x300.jpg'
l1.title = "Awesome voucher!!!"
l1.category = 'vouchers'
l1.status = 'live'
l1.seller_id = 1
l1.save

l2 = Listing.new
l2.id = 2
l2.start_price = 9000
l2.start_time = Time.now.in_time_zone("Melbourne") + 300
l2.end_time = l2.start_time + 1500
l2.image_url ='https://i.ebayimg.com/00/s/NjQwWDY0MA==/z/Xj0AAOSwBP9bhiv5/$_35.JPG'
l2.title = "Another awesome voucher!!!"
l2.category = 'vouchers'
l2.status = 'live'
l2.seller_id = 1
l2.save

l3 = Listing.new
l3.id = 3
l3.start_price = 500
l3.start_time = Time.now.in_time_zone("Melbourne") + 3000
l3.end_time = l3.start_time + 600
l3.image_url ='https://officeproductsdepot.com.au/wcsstore/ONCatalogAssetStore/images/DavidJonesGC.jpg'
l3.title = "David Jones Gift Card"
l3.category = 'gift cards'
l3.status = 'live'
l3.seller_id = 1
l3.save

l4 = Listing.new
l4.id = 4
l4.start_price = 2500
l4.start_time = Time.now.in_time_zone("Melbourne") + 30000
l4.end_time = l4.start_time + 1200
l4.image_url ='https://cdn.shopify.com/s/files/1/2716/7590/products/mi-laptop-pro-15-6-inch-3725679001644_600x.jpg?v=1534831288'
l4.title = "Catch a laptop bargain!"
l4.category = 'laptops'
l4.status = 'live'
l4.seller_id = 2
l4.save

l5 = Listing.new
l5.id = 5
l5.start_price = 10000
l5.start_time = Time.now.in_time_zone("Melbourne") + 100
l5.end_time = l5.start_time + 1800
l5.image_url ='https://i.ebayimg.com/images/g/SpwAAOSw4DJYfJom/s-l300.jpg'
l5.title = "Car bargain"
l5.category = 'cars'
l5.status = 'live'
l5.seller_id = 2  
l5.save