# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Booking.destroy_all
Flat.destroy_all
User.destroy_all

carlos_owner = User.create!(name: "Carlos", password: "password", email: "carlos@carlos.com", owner: true)


cristobal_renter = User.create!(name: "Cristobal", password: "password", email: "cristobal@cristobal.com")

flat_carlos = Flat.new(title: "Beautiful flat", address:"Anselm Clave 9", capacity: 4, user: carlos_owner, lat: 41.3851, long: 2.1734, price: 30.0, description: "Nice 4 bed flat in Gracia" )
flat_carlos.remote_picture_url = "https://www.shbarcelona.com/blog/en/wp-content/uploads/2015/12/flathuntingbcnroom.jpg"
flat_carlos.save!


booking_carlos = Booking.create!(user: cristobal_renter, flat: flat_carlos, start_date: Date.new(2019,02,19), end_date: Date.new(2019,02,21), total_price: 90)



juan_owner = User.create(name: "juan", password: "password", email: "juan@carlos.com", owner: true)

valentin_renter = User.create(name: "Valentin", password: "password", email: "Valentin@valentin.com")

flat_juan = Flat.new(title: "Flat close to Espanya", address:"Sants", capacity: 3, user: juan_owner, lat: 41.3851, long: 2.1734, price: 40.0, description: "Nice 3 bed flat in sants" )
flat_juan.remote_picture_url = "https://images.dwell.com/photos-6063391372700811264/6133539606739378176-large/barcelona-flat-living-room.jpg"
flat_juan.save!

booking_valentin = Booking.create(user: valentin_renter, flat: flat_juan, start_date: Date.new(2019,03,19), end_date: Date.new(2019,03,21), total_price: 120)




flat_juan2 = Flat.new(title: "Flat in raval", address:"Raval", capacity: 5, user: juan_owner, lat: 41.3851, long: 2.1734, price: 40.0, description: "Nice 3 bed flat in sants" )
flat_juan2.remote_picture_url = "https://barcelona-home.com/cms/wp-content/uploads/2012/09/Students.jpg"
flat_juan2.save!



flat_juan3 = Flat.new(title: "Flat Barceloneta", address:"Barceloneta", capacity: 4, user: juan_owner, lat: 41.3851, long: 2.1734, price: 40.0, description: "Nice 3 bed flat in sants" )
flat_juan3.remote_picture_url = "https://www.hduquesadecardona.com/media/hotel-duquesa-de-cardona-imageLinkduquesa-cardona-duquesa-fotos-hotel-barcelona2.jpg"
flat_juan3.save!




flat_carlos2 = Flat.new(title: "flat in eixample", address:"Eixample", capacity: 1, user: carlos_owner, lat: 41.3851, long: 2.1734, price: 40.0, description: "Nice 3 bed flat in sants" )
flat_carlos2.remote_picture_url = "https://www.barcelonahacks.com/wp-content/uploads/2017/07/cheap-barcelona-apartments-1024x640.jpg"
flat_carlos2.save!



	# create_table "users", force: :cascade do |t|
	# 	t.string "email", default: "", null: false
	# 	t.string "encrypted_password", default: "", null: false
	# 	t.string "reset_password_token"
	# 	t.datetime "reset_password_sent_at"
	# 	t.datetime "remember_created_at"
	# 	t.datetime "created_at", null: false
	# 	t.datetime "updated_at", null: false
	# 	t.boolean "owner", default: false
	# 	t.string "name"
	# 	t.index ["email"], name: "index_users_on_email", unique: true
	# 	t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
	# end


	# create_table "flats", force: :cascade do |t|
	# 	t.string "address"
	# 	t.integer "capacity"
	# 	t.string "picture"
	# 	t.float "lat"
	# 	t.float "long"
	# 	t.float "price"
	# 	t.text "description"
	# 	t.bigint "user_id"
	# 	t.datetime "created_at", null: false
	# 	t.datetime "updated_at", null: false
	# 	t.string "title"
	# 	t.index ["user_id"], name: "index_flats_on_user_id"
	# end


	# create_table "bookings", force: :cascade do |t|
	# 	t.bigint "flat_id"
	# 	t.bigint "user_id"
	# 	t.date "start_date"
	# 	t.date "end_date"
	# 	t.float "total_price"
	# 	t.datetime "created_at", null: false
	# 	t.datetime "updated_at", null: false
	# 	t.index ["flat_id"], name: "index_bookings_on_flat_id"
	# 	t.index ["user_id"], name: "index_bookings_on_user_id"
	# end


