require 'watir'

browser = Watir::Browser.new :firefox
browser.window.maximize
browser.goto 'https://www.saucedemo.com'

browser.text_field(id: 'user-name').send_keys 'standard_user'
browser.text_field(id: 'password').send_keys 'secret_sauce'
browser.button(name: 'login-button').click

if browser.url == 'https://www.saucedemo.com/inventory.html'
  puts 'Test 1: Login successful. User is on the products page.'
else
  puts 'Test 1: Login failed. User is not on the products page.'
end

browser.close
