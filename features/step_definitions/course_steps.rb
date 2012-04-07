Given /^the following courses exist$/ do |table|
  table.hashes.each{|h| Course.create!(h)}
end

Given /^"([^"]*)" is a prerequisite for "([^"]*)"$/ do |arg1, arg2|
  prereq = Course.find_by_code(arg1)
  course = Course.find_by_code(arg2)
  course.add_prerequisite! prereq
end
