step 'my user agent is :robot' do |robot|
  page.driver.browser.header('user_agent', robot)
end

step 'I am on the test page' do
  visit '/home'
end

step 'I should not see the block content' do
  page.should_not have_content('Bots should not see this')
end

step 'I should see the block content' do
  page.should have_content('Bots should not see this')
end
