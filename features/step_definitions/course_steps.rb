Given /^the following courses exist$/ do |table|
  table.hashes.each{|h| Course.create!(h)}
end
