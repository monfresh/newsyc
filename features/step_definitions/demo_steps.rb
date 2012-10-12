Given /^I am logged in$/ do
    macro 'I touch "Profile"'
    if view_with_mark_exists("Logout")
        sleep(STEP_PAUSE)
    else
        macro 'I fill in "Username" with "monfresh"'
        macro 'I touch "Password"'
        macro 'I fill in "Password" with "pourqu01combien?"'
        macro 'I touch done'
        macro 'I wait to see "Logout"'
    end
end

When /^I go to comment on a submission$/ do
  macro 'I touch "Home"'
  macro 'I touch list item number 4'
  macro 'I wait'
  macro 'I touch "reply"'
end

But /^I cancel the comment form$/ do
  macro 'I touch "Cancel"'
end

Then /^I should see the submission$/ do
  macro 'I should see "Submission"'
end

And /^a comment from "([^\"]*)" should not appear$/ do |username|
  users = []
  total_rows = query("tableView",numberOfRowsInSection:0)
  end_of_range = total_rows[0] - 1
  (0..end_of_range).each do |row|
    scroll_to_row "tableView", row
    sleep(STEP_PAUSE)
    users.push(label "TableViewCell")
  end
  result = users.select {|user| user.include? "#{username}"}
  if result.empty? 
    macro 'I touch "Hacker News"'
  else
    raise "'#{username}' was found but wasn't expected!"
  end
end

Then /^I tap each cell$/ do
  total_cells = query("tableView",numberOfRowsInSection:0).first
  total_cells_at_once = query("tableViewCell").length
  total_scrolls = (total_cells/total_cells_at_once).ceil
  row = 0
  
  total_scrolls.times do
    scroll_to_row "tableView", row
    macro 'I wait'
    
    
    (1..total_cells_at_once).each do |cell|
      if query("tableViewCell index:1").empty?
        cell += 2
      elsif query("tableViewCell index:0").empty?
        cell += 1
      end
      
      macro %Q[I touch list item number #{cell}]
      wait_for(5) { not query("navigationItemButtonView").empty? }
      # if query("navigationItemButtonView").empty?
      #   macro %Q[I touch list item number #{cell+1}]
      #   wait_for(5) { not query("navigationItemButtonView").empty? }
      #   macro 'I go back'
      # else
      #   macro 'I go back'
      # end
      macro 'I go back'
      
      sleep(1)
    end
    row += total_cells_at_once
  end

end
