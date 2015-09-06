
Then /^(?:I|they|she|he) should not see "([^"]*)" on first answer$/ do |text|
  within(first(".card-panel")) do
    if page.respond_to? :should
      page.should have_no_content(text)
    else
      assert page.has_no_content?(text)
    end
  end
end

When /^(?:|I|he|she|"([^"]*)") (?:|follow|follows) "([^"]*)" on first answer$/ do |name, link|
  within(first(".card-panel")) do
    click_link(link)
  end
end

Then /^the first answer should have been followed 1 times$/ do
  within(first(".card-panel")) do
    if page.respond_to? :should
      page.should have_content("1")
    else
      assert page.has_content?("1")
    end
  end
end