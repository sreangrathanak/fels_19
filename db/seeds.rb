
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
10.times do |n|  
  name=Faker::Lorem.sentence(1)  
  Category.create!(name:name)
end

users=User.order(:created_at).take(2)
users.each{|user|
  10.times do |n|    
    result= Random.new.rand(4..20)    
    category_id=Random.new.rand(1..4)    
    Lesson.create!(user_id:user.id,category_id:category_id,result:result)
  end
}

200.times do |n|    
  content=Faker::Lorem.word    
  category_id= Random.new.rand 1..10    
  Word.create!(content:content, category_id:category_id)
end

words=Word.all
words.each {|word|  
  content=Faker::Lorem.word  
  correct=true  
  WordAnswer.create!(content: content, correct:correct,word_id:word.id)
}

3.times do |n|
  words.each{|word|    
    content=Faker::Lorem.word    
    correct=false    
    WordAnswer.create!(content: content, correct:correct,word_id:word.id) 
  }
end

lessons=Lesson.order(:created_at).take(5)  
lessons.each{|lesson|    
  category=Category.find_by(id:lesson.category_id)    
  20.times do |n|            
    word=category.words(:order => "RAND()").first              
    word_answer=WordAnswer.where(word_id:word.id).order("RAND()").first                            
    LessonWord.create!(lesson_id:lesson.id,word_id:word.id,word_answer_id:word_answer.id)
  end
}
