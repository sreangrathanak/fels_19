
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
#declare users variable
users = User.order(:created_at).take(6)

#Category
10.times do |n|
  name="Rathanak-#{n+1} Category"
  Category.create(name: name)
end
#declare users variable
categories = Category.order(:created_at).take(3)
# get only one user
user_first=users.first
#Lesson
5.times do
  result="wrong-right"
  categories.each{|category|
    Lesson.create(result: result,user_id: user_first.id, category_id: category.id)
 }
end
#Word 
3.times do |n|
  content="Test-#{n+1}"
  categories.each{|category|
    Word.create(content: content,category_id:category.id)
  }
end
#WordAnswer
words=Word.order(:created_at)
3.times do |n|
  content="Test Answer-#{n+1}"
  words.each{|word|
    WordAnswer.create(content: content,word_id:word.id)
  }
end
#get lesson
lessons= Lesson.order(:created_at).take(2)
#get word answer
word_answers=WordAnswer.order(:created_at)
#LessonWord
2.times do
lessons.each{|lesson|
  words.each{|word|
    word_answers.each{|word_answer|
      LessonWord.create(lesson_id: lesson.id,word_id:word.id,word_answer_id:word_answer.id)
    }
  }
}
end