# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

def wipe_all_data
  User.destroy_all
  Hospital.destroy_all
  Question.destroy_all
  Answer.destroy_all
  HospitalLike.destroy_all
  AnswerLike.destroy_all
  Follow.destroy_all
  Article.destroy_all
  DoctorList.destroy_all
  DoctorVerificationRequest.destroy_all
  HospitalVerificationRequest.destroy_all
  HospitalList.destroy_all
  Rating.destroy_all
  Review.destroy_all
  Tagging.destroy_all
end

wipe_all_data

User.create!(
    name: 'Monsior Robert',
    email: 'admin@example.com',
    role: "admin",
    password: 'password1',
    date_of_birth: Date.today
)

manager = User.create!(
    name: 'Maria Caris',
    email: 'manager@example.com',
    role: "manager",
    password: 'password1',
    date_of_birth: Date.today
)

hospital = Hospital.create!(
    name: 'John Hopkins',
    manager: manager,
    verified: true,
    address: '1800 Orleans St, Baltimore, MD 21287, United States'
)

doctor = User.create!(
    name: 'Will Carby',
    email: 'doc1@example.com',
    role: "doctor",
    password: 'password1',
    verified: true,
    hospital: hospital,
    date_of_birth: Date.today
)

client1 = User.create!(
    name: 'John Doe',
    email: 'user1@example.com',
    role: "user",
    password: 'password1',
    date_of_birth: Date.today
)

client2 = User.create!(
    name: 'Jill Jackson',
    email: 'user2@example.com',
    role: "user",
    password: 'password1',
    date_of_birth: Date.today
)

question1 = Question.create!(
    caption: '',
    body: 'little headache since yesterday',
    user: client1
)
question2 = Question.create!(
    caption: '',
    body: 'when can I start considering child planning',
    user: client1
)
question3 = Question.create!(
    caption: '',
    body: 'do I need to get glasses for my eyes?',
    user: client2
)
Answer.create!(
   question: question1,
   content: 'try to take some rest. it helps ;)',
   user: doctor
)
