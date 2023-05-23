******************************** Welcome to AlexCycle ********************************************

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version : 2.6.5

* Rails version : 7.0.4.3

* Configuration : bundle

* Database creation : 1) rails db:create 2) rails db:seed

* How to run the test suite : bundle exec rspec

Simple as that, and you're good to go 🙌

The app contains all the necessary requirements (sorry for the poor UI, time factor wasn't in my favor)

The only issue is that 2-3 tests might fail because they render the index and show views when testing the bicycles_controller, and those views trigger this error 👇🏻

`Can't resolve image into URL: undefined method `persisted?' for nil:NilClass`

P.S : you can find a file named "telegram_bot.rb" inside the /app/ directory .. I was trying to make it on the last day but also, time wasn't in my favor 

Don't hesitate to ask me about anything that's unclear.


