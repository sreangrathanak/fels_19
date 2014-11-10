
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
#create categories
#generate category 10 times
10.times do |n|
  #generate sentence of name using Faker::Lerem
  name=Faker::Lorem.sentence(1)
  #Save in to table category
  Category.create!(name:name)
end
#create Lesson
#get two user
users=User.order(:created_at).take(2)
#run in each user
users.each{|user|
  #generate 10 times of lesson in each user
  10.times do |n|
    #generate the result user learn
    result= Random.new.rand(4..20)
    #generate random category
    category_id=Random.new.rand(1..4)
    #save into table
    Lesson.create!(user_id:user.id,category_id:category_id,result:result)
  end
}
#create words
#generate word 200 times
200.times do |n|
    #generate word of content using Faker::word
    content=Faker::Lorem.word
    #generate category id with the number of random 1 to 10
    category_id= Random.new.rand 1..10
    #save into table
    Word.create!(content:content, category_id:category_id)
end
#Generate Answer Word
#get all user
words=Word.all
#generate one right word anwser in each Word
#in each user
words.each {|word|
  #generate content of word in answer word
  content=Faker::Lorem.word
  #set correct is true
  correct=true
  #save into table WordAnswer
  WordAnswer.create!(content: content, correct:correct,word_id:word.id)
}
#generate 3 wrong word in each word
#loop 3 times
3.times do |n|
  #in each user
  words.each{|word|
    #generate content of word in word answer
    content=Faker::Lorem.word
    #set correct equal false
    correct=false
    #save into WoadAnswer
    WordAnswer.create!(content: content, correct:correct,word_id:word.id) 
  }
end
#generate LessonWord
  #get 3 lessons
  lessons=Lesson.order(:created_at).take(5)  
  #in each lesson
  lessons.each{|lesson|
    #find category from the lesson
    category=Category.find_by(id:lesson.category_id)
    #loop 20 times of lesson word
    20.times do |n|      
      #get word in category and in random rang
      word=category.words(:order => "RAND()").first      
        #find word answer in word and get it in random rang
        word_answer=WordAnswer.where(word_id:word.id).order("RAND()").first                
            #save in to table LessonWord
            LessonWord.create!(lesson_id:lesson.id,word_id:word.id,word_answer_id:word_answer.id)
    end
  }
