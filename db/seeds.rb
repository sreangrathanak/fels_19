User.create!(name:  "Rathanak Jame",
             email: "sreangrathanak@gmail.com",
             password:              "password",
             password_confirmation: "password",
             isadmin: true)
99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end