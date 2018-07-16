# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# rails g model post title:string body:text
# rails g controller posts

Idea.delete_all
Review.delete_all

25.times do
    i = Idea.create(
      title: Faker::Hacker.say_something_smart,
      description: Faker::HarryPotter.quote
    )

    if i.valid?
      rand(0..10).times do
        Review.create(
          body: Faker::Matz.quote,
          idea: i
        )
    end
  end
end

idea = Idea.all
review = Review.all

puts Cowsay.say("Created #{idea.count} ideas and created #{review.count} reviews", :ghostbusters)

# ==> criar User model:
# 		* rails g model user first_name last_name email password_digest
# 		-> incluir index para email na migration criada	
# 		* rails db:migrate
# 		-> incluir validações e method has_secure_password
# 		-> incluir Gem ‘bcrypt’ and run bundle

# 	-> Incluir User FK nas duas tabelas j’a existentes (Post e Comment):
# 		- criar as migrations:
# 			* rails g migration add_user_to_posts user:references 
# 			* rails g migration add_user_to_comments user:references 
# 			* rails db:migrate






