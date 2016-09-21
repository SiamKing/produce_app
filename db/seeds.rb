10.times do
  User.create(
    name: Faker::Name.first_name,
    email: Faker::Internet.email,
    password: Faker::Internet.password
  )
end

fruit = ["Apples", "Bananas", "Oranges", "Strawberries", "Blueberries", "Pears", "Peaches", "Pineapple", "Avocados", "Grapes"]
fruit_image = ['https://1.bp.blogspot.com/-3zgKOs64JNc/V68jCHCWBfI/AAAAAAAACyU/pYGy5j-onZAwr2bm1LZ1exExgasXVzHqwCLcB/s1600/033015-health-apples.png',
               'http://saltmarshrunning.com/wp-content/uploads/2014/09/bananasf.jpg', 'http://www.sealdsweet.com/img/oranges.jpg',
               'http://www.puraforceremedies.com/wp-content/uploads/2016/05/Strawberries.jpg', 'http://www.medicalnewstoday.com/content/images/articles/287/287710/blueberries.jpg',
               'http://weknowyourdreams.com/image.php?pic=/images/pear/pear-02.jpg', 'https://www.organicfacts.net/wp-content/uploads/peach.jpg',
               'http://freenology.com/images/71442946288pineapple.jpg', 'http://www.eatsxm.com/uploads/1/3/8/6/13862036/3554628_orig.jpg',
               'http://cdn1.medicalnewstoday.com/content/images/articles/271156-grapes.jpg']

10.times do
  counter = 0
  Produce.create(
    name: fruit[counter],
    expires_in: Faker::Number.between(5, 14),
    image: fruit_image[counter],
    kind: "fruit"
  )
  counter += 1
end

veg = ["Lettuce", "Broccoli", "Kale", "Onion", "Potato", "Cucumber", "Carrots", "Celery", "Bell Peppers", "Zucchini"]
veg_image = ['http://www.continentalenterprisesinc.com/products/vegetables/lettuce_1.png', 'http://www.medicalnewstoday.com/content/images/articles/266/266765/two-heads-of-broccoli.jpg',
             'http://www.discoverkale.co.uk/wp-content/uploads/2014/12/kale_title.jpg', 'http://www.petpoisonhelpline.com/wp-content/uploads/2011/10/Onion.jpg',
             'http://cdn1.medicalnewstoday.com/content/images/articles/280/280579/potatoes.jpg', 'http://www.livescience.com/images/i/000/076/219/original/cucumbers.jpg?interpolation=lanczos-none&downsize=*:1000',
             'https://woolworthsbabyandtoddlerclub.com.au/images/imageLibrary/will-carrots-really-help-my-babys-eyesight-454.jpg', 'https://draxe.com/wp-content/uploads/2015/04/bigstock-Fresh-green-celery-isolated-on-52080031.jpg',
             'http://www.finecooking.com/assets/uploads/posts/5086/ING-bell-pepper_sql.jpg', 'http://www.motherearthnews.com/~/media/Images/MEN/Editorial/Articles/Magazine%20Articles/2012/06-01/Zucchini%20Milk%20Recipe/m-zucchini.jpg']

10.times do
  counter = 0
  Produce.create(
    name: veg[counter],
    expires_in: Faker::Number.between(5, 14),
    image: veg_image[counter],
    kind: "veggie"
  )
  counter += 1
end
