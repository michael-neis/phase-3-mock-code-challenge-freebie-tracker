puts "Removing duplicate data..."
Company.destroy_all
Dev.destroy_all
Freebie.destroy_all

puts "Creating companies..."
Company.create(name: "Google", founding_year: 1998)
Company.create(name: "Facebook", founding_year: 2004)
Company.create(name: "Dunder Mifflin", founding_year: 2002)
Company.create(name: "Enron", founding_year: 1995)

puts "Creating devs..."
Dev.create(name: "Rick")
Dev.create(name: "Morty")
Dev.create(name: "Mr. Meseeks")
Dev.create(name: "Gazorpazop")

puts "Creating freebies..."

# ***************************************************************
# * TODO: create freebies! Remember, a freebie belongs to a dev *
# * and a freebie belongs to a company.                         *
# ***************************************************************
# Create freebies Here

itemOptions = ["Sunglasses", "Rubber Duck", "Baseball Hat", "Sticker", "Button", "Bandana", "Pen"]

10.times{
    item = itemOptions.sample
    num = rand(1..10)
    company = Company.all.sample
    dev = Dev.all.sample
    Freebie.create(item_name: item, value: num, company: company, dev: dev)
}

puts "Seeding done!"
