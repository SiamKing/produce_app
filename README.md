# README
Produce App

To see the app in action visit: https://pure-badlands-43710.herokuapp.com
Type 'bundle install' to get the gems installed
To run it locally type 'rails db:migrate', then 'rails db:seed' to get the database running and seeded
If you want to be able to sign in with facebook, through the omniauth-facebook gem follow these steps:
  1. Go to https://developers.facebook.com/and sign in if you're not already
  2. Click on 'My Apps' in the nav bar and add a new app
  3. Select Website as your platforms
  4. Choose a name for the app, choose a category (I used Food & Drink) and hit 'Create App ID'
  5. Scroll down to the section title 'Tell us about your website' and add the url 'http://localhost:3000'
  6. In the next steps section, click 'Skip to Developer Dashboard'
  7. I like to copy the app ID and the app secret in a TextEdit document outside of my Text Editor (ie. Atom or Sublime)
  8. In the sidebar menu on the left under Products, click 'Add Product'
  9. Form here hit 'Get Started' next to Facebook login
  10. Where it says 'Valid OAuth redirect URIs', type: http://localhost:3000/users/auth/facebook/callback and save changes
  11. When you are ready to deploy locally, in the terminal, type: FACEBOOK_APP_ID=‘your_app_id' FACEBOOK_SECRET=‘your_secret' rails s
  12. You should be good to go!

Go to http://localhost:3000 in your web browser and start playing
Sign up to create an account or sign in with facebook
From there you can add produce to your fridge from the produce menu
You can see juices and also juices made with select produce
On the home page you can see what is in your fridge and the days left until expiration for each Item


* Ruby version - 2.2.3p173

Released under the MIT License, Copyright (c) 2016
