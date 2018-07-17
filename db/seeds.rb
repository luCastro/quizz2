# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# rails g model post title:string body:text
# rails g controller posts
PASSWORD = "supersecret"

Review.delete_all
Idea.delete_all
Use.delete_all

super_use = Use.create(
  first_name: "Jon",
  last_name: "Snow",
  email: "js@winterfell.gov",
  password: PASSWORD,
  # admin: true
)

10.times do
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name

  Use.create(
    first_name: first_name,
    last_name: last_name,
    email: "#{first_name.downcase}.#{last_name.downcase}@example.com",
    password: PASSWORD
  )
end

use = Use.all

puts Cowsay.say "Created #{use.count} uses", :tux


25.times do
    i = Idea.create(
      title: Faker::Hacker.say_something_smart,
      description: Faker::HarryPotter.quote,
      use: Use.all.sample
    )

    if i.valid?
      rand(0..10).times do
        Review.create(
          body: Faker::Matz.quote,
          idea: i,
          use: Use.all.sample
        )
    end
  end
end

idea = Idea.all
review = Review.all

puts Cowsay.say("Created #{idea.count} ideas and created #{review.count} reviews", :ghostbusters)












