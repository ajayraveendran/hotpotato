Listing.destroy_all
l1 = Listing.new
l1.start_time = Time.now
l1.start_price = 100
l1.image_url ='https://via.placeholder.com/300'
l1.status = 'live'
l1.category = 'vouchers'
l1.title = 'cool voucher listing'
l1.save

l2 = Listing.new
l2.start_time = Time.now + 300
l2.start_price = 100
l2.image_url ='https://via.placeholder.com/300'
l2.status = 'live'
l2.category = 'vouchers'
l2.title = 'cool voucher listing'
l2.save

l3 = Listing.new
l3.start_time = Time.now + 3000
l3.start_price = 100
l3.image_url ='https://via.placeholder.com/300'
l3.status = 'live'
l3.category = 'vouchers'
l3.title = 'cool voucher listing'
l3.save

l4 = Listing.new
l4.start_time = Time.now + 30000
l4.start_price = 100
l4.image_url ='https://via.placeholder.com/300'
l4.status = 'live'
l4.category = 'vouchers'
l4.title = 'cool voucher listing'
l4.save