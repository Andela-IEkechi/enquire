When /^(?:|I|he|she) fill in the following:$/ do |fields|
  fields.rows_hash.each do |name, value|
    step %{I fill in "#{name}" with "#{value}"}
  end
end

When /^(?:|I|he|she) fill in "([^"]*)" with "([^"]*)"$/ do |field, value|
  fill_in(field, :with => value)
end

When /^(?:|I|he|she) select "([^"]*)" from "([^"]*)"$/ do |value, field|
  select(value, from: field)
end

When /^(?:|I|he|she) press "([^"]*)"$/ do |button|
  click_button(button)
end

When /^(?:|I|he|she) (?:|follow|follows) "([^"]*)"$/ do |link|
  click_link(link)
end

Given /^(?:|I|they|he|she) (?:am|are|is|go|goes) (?:on|to) (.+)$/ do |page_name|
  visit path_to(page_name)
end

Then /^(?:I|they|she|he) should see "([^"]*)"$/ do |text|
  if page.respond_to? :should
    page.should have_content(text)
  else
    assert page.has_content?(text)
  end
end

Then /^(?:I|they|she|he) should not see "([^"]*)"$/ do |text|
  if page.respond_to? :should
    page.should have_no_content(text)
  else
    assert page.has_no_content?(text)
  end
end

Then /^(?:|I|he) should be on ([^']+)$/ do |page_name|
  current_path = URI.parse(current_url).path
  if current_path.respond_to? :should
    current_path.should == path_to(page_name)
  else
    assert_equal path_to(page_name), current_path
  end
end

When /^(?:|I|he|she) confirms popup$/ do
  page.driver.browser.switch_to.alert.accept #if Capybara.javascript_driver == :selenium
end

When /^(?:|I|he|she) dismisses popup$/ do
  page.driver.browser.switch_to.alert.dismiss if Capybara.javascript_driver == :selenium
end

When /^(?:|I|he|she) (?:|wait|waits) for (\d+) seconds?$/ do |n|
  sleep(n.to_i)
end

# Then /^the "([^"]*)" field(?: within (.*))? should contain "([^"]*)"$/ do |field, parent, value|
#   with_scope(parent) do
#     value = Regexp.escape(value) # because email addresses contain pluses (+)
#     field = find_field(field)
#     field_value = (field.tag_name == 'textarea') ? field.text : field.value
#     if field_value.respond_to? :should
#       field_value.should =~ /#{value}/
#     else
#       assert_match(/#{value}/, field_value)
#     end
#   end
# end
