Given /^there is a question already asked by a client$/ do
  FactoryGirl.create(:question)
end

Given /^all questions now have a few answers each$/ do
  Question.all.each do |question|
    FactoryGirl.create_list(:answer, rand(2..5), question: question)
  end
end