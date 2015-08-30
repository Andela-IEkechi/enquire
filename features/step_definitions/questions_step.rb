Given /^there (?:is|are) (\d+) (?:question|questions) already asked by clients$/ do |n|
  n.to_i.times.each do
    FactoryGirl.create(:question)
  end
end

Given /^all questions now have a few answers each$/ do
  Question.all.each do |question|
    FactoryGirl.create_list(:answer, rand(2..5), question: question)
  end
end