# Add a declarative step here for populating the DB with movies.

Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    Movie.create!(:title => movie[:title], :rating => movie[:rating], :release_date => movie[:release_date])
  end
  #fail "Unimplemented"
end

Then /(.*) seed movies should exist/ do | n_seeds |
  Movie.count.should be n_seeds.to_i
end

# Make sure that one string (regexp) occurs before or after another one
#   on the same page

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.body is the entire content of the page as a string.
  page.body.should =~ /#{e1}.*#{e2}/m
  #fail "Unimplemented"
end

# Make it easier to express checking or unchecking several boxes at once
#  "When I uncheck the following ratings: PG, G, R"
#  "When I check the following ratings: G"

When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
  # HINT: use String#split to split up the rating_list, then
  #   iterate over the ratings and reuse the "When I check..." or
  #   "When I uncheck..." steps in lines 89-95 of web_steps.rb
  ratings = rating_list.split(", ")
  for rating in ratings
    if uncheck == "un"
      step "I uncheck \"ratings_"+rating+"\""
    else
      step "I check \"ratings_"+rating+"\""
    end
  end

  #fail "Unimplemented"
end

Then /I should see all the movies/ do
  # Make sure that all the movies in the app are visible in the table
  page.all('table#movies tbody > tr').count.should == Movie.count
  #fail "Unimplemented"
end

Then /These movies are visible - (.*)/ do |movie_list|
  # Write code here that turns the phrase above into concrete actions
  # pending # Write code here that turns the phrase above into concrete actions
  movies = movie_list.split(', ')
  for movie in movies
    step "I should see " + movie
  end
end

Then /These movies are not visible - (.*)/ do |movie_list|
  # Write code here that turns the phrase above into concrete actions
  # pending # Write code here that turns the phrase above into concrete actions
  movies = movie_list.split(', ')
  for movie in movies
    step "I should not see " + movie
  end
end 

Then /I should see order (.*)/ do |movie_list|
  # pending # Write code here that turns the phrase above into concrete actions
  movies = movie_list.split(', ')
  # for movie in movies
  #   step "I should not see " + movie
  # end

  0.upto(movies.length()-2) do |i|
    # log(movies[i])
    step "I should see " + movies[i] + " before " + movies[i+1] 
  end
end