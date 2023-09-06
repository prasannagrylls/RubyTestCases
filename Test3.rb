require 'watir'

browser = Watir::Browser.new :firefox
browser.window.maximize
browser.goto 'https://www.saucedemo.com'

browser.text_field(id: 'user-name').send_keys 'standard_user'
browser.text_field(id: 'password').send_keys 'secret_sauce'
browser.button(name: 'login-button').click

browser.button(id: 'add-to-cart-sauce-labs-backpack').click
browser.button(id: 'add-to-cart-sauce-labs-bike-light').click

browser.a(class: 'shopping_cart_link').click
browser.button(name: 'checkout').click

browser.text_field(id: 'first-name').send_keys 'Prasanna'
browser.text_field(id: 'last-name').send_keys 'Kumar'
browser.text_field(id: 'postal-code').send_keys '517112'
browser.input(id: 'continue').click


Item1 = {
  name: 'Sauce Labs Backpack',
  description: 'carry.allTheThings() with the sleek, streamlined Sly Pack that melds uncompromising style with unequaled laptop and tablet protection.',
  price: '$29.99'
}

Item2 = {
  name: 'Sauce Labs Bike Light',
  description: "A red light isn't the desired state in testing but it sure helps when riding your bike at night. Water-resistant with 3 lighting modes, 1 AAA battery included.",
  price: '$9.99'
}

price_info = {
  item_total: '$39.98',
  tax: '$3.20',
  total: '$43.18'
}

if browser.text.include?(Item1[:name]) &&
  browser.text.include?(Item1[:description]) &&
  browser.text.include?(Item1[:price])
  puts "Item1 details verified:"
  puts "Name: #{Item1[:name]}"
  puts "Description: #{Item1[:description]}"
  puts "Price: #{Item1[:price]}"
else
  puts "Item1 details verification failed."
end

if browser.text.include?(Item2[:name]) &&
  browser.text.include?(Item1[:description]) &&
  browser.text.include?(Item1[:price])
  puts "Item1 details verified:"
  puts "Name: #{Item1[:name]}"
  puts "Description: #{Item1[:description]}"
  puts "Price: #{Item1[:price]}"
else
  puts "Item1 details verification failed."
end

if browser.text.include?("Item total: #{price_info[:item_total]}") &&
  browser.text.include?("Tax: #{price_info[:tax]}") &&
  browser.text.include?("Total: #{price_info[:total]}")
  puts "Price Information verified:"
  puts "Item total: #{price_info[:item_total]}"
  puts "Tax: #{price_info[:tax]}"
  puts "Total: #{price_info[:total]}"
else
  puts "Price Information verification failed."
end

browser.scroll.to(:bottom)
browser.button(id: 'finish').click

if browser.text.include?('Thank you for your order!')
  puts "Order has been successfully placed"
else
  puts "Order not placed"
end

browser.close
