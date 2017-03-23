# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ProductCategory.destroy_all

# User.create![
# 	{first_name: "Thabo", last_name: "Lebese", email: "nkhatho@outlook.com", password: "111111"}
# ]
ProductCategory.create! [
	{category: "Audio and Music", keywords: "Album"},
	{category: "Movies and Video", keywords: "Batman, Superman, Star Wars, Lord of the Rings"},
	{category: "Software", keywords: "Microsoft Office, Anti-virus"},
	{category: "Animals", keywords: "Dog, Cat, Cow, Sheep"},
	{category: "Art and Rare Items", keywords: "Painting"},
	{category: "Bicycles", keywords: "Mountain Bike, BMX"},
	{category: "Camera", keywords: "Canon"},
	{category: "Mobile Phones", keywords: "iPhone, Galaxy, Samsung Galaxy, Nokia"},
	{category: "Clothing", keywords: ""},
	{category: "Computers and Accessories", keywords: "Lenovo, Dell, Apple"},
	{category: "Cosmetics", keywords: ""},
	{category: "Framing and Industries", keywords: ""},
	{category: "Furniture", keywords: "Desk"},
	{category: "Gaming and Consoles", keywords: ""},
	{category: "Home, Garden and Tools", keywords: ""},
	{category: "Jewelery and Accessories", keywords: ""},
	{category: "Jobs Available", keywords: "HR"},
	{category: "Job Seekers", keywords: ""},
	{category: "Property for Rental", keywords: ""},
	{category: "Property for Sale", keywords: ""},
	{category: "Scooters and Motorcycles", keywords: ""},
	{category: "Sports and Outdoor", keywords: ""},
	{category: "Tablets", keywords: "iPad"},
	{category: "Toys and Dolls", keywords: ""},
	{category: "TV, Radio and Visuals", keywords: ""},
	{category: "Vehicles", keywords: "Toyota, BMW, X1"},
	{category: "Vehicle Parts", keywords: ""},
	{category: "Other", keywords: ""},
]
