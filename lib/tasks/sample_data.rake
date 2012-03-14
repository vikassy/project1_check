namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    admin = User.create!(name: "Vikas S Yaligar",
 			 email: "vikasyaligar.it@gmail.com",
			 password: "foobar",
			 password_confirmation: "foobar")
    admin.toggle!(:admin)
    admin = User.create!(name: "Ketan Pandhi",
 			 email: "ketanpandhi13@gmail.com",
			 password: "foobar",
			 password_confirmation: "foobar")
    admin.toggle!(:admin)
    admin = User.create!(name: "Mithun Bylappa",
 			 email: "mithun_007@live.com",
			 password: "foobar",
			 password_confirmation: "foobar")
    admin.toggle!(:admin)
    admin = User.create!(name: "Karan Sheoran",
 			 email: "sheorankaran11@gmail.com",
			 password: "foobar",
			 password_confirmation: "foobar")
    admin.toggle!(:admin)
end
end
=begin    User.create!(name: "Example User",
end
                 email: "example@railstutorial.org",
                 password: "foobar",
                 password_confirmation: "foobar")
    99.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      password  = "password"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password) 
 end
  end
end
=end
