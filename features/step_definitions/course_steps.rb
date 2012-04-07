Given /^the following courses exist$/ do |table|
  table.hashes.each{|h| Course.create!(h)}
end

Given /^"([^"]*)" is a prerequisite for "([^"]*)"$/ do |arg1, arg2|
  prereq = Course.find_by_code(arg1)
  course = Course.find_by_code(arg2)
  course.prerequisites << prereq
  course.save!
end

Then /^I should see "([^"]*)" is a prerequisite$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end
