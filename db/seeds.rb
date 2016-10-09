10.times do
  User.create(
    name: Faker::Name.first_name,
    email: Faker::Internet.email,
    password: Faker::Internet.password,
  )
end

fruit = ["Apples", "Bananas", "Oranges", "Strawberries", "Blueberries", "Pears", "Peaches", "Pineapple", "Avocados", "Grapes", "Cranberries", "Lemons", "Tomatoes"]
fruit_image = ["app/assets/images/apples.png", "app/assets/images/bananas.jpg", "app/assets/images/oranges.jpg", "app/assets/images/Strawberries.jpg", "app/assets/images/blueberries.jpg",
               "app/assets/images/pear.jpg", "app/assets/images/peach.jpg", "app/assets/images/pineapple.jpg", "app/assets/images/avocado.jpg", "app/assets/images/grapes.jpg",
               "app/assets/images/cranberries.jpg", "app/assets/images/lemon.jpg", "app/assets/images/tomatoes.jpg"]
# fruit_image = ['https://1.bp.blogspot.com/-3zgKOs64JNc/V68jCHCWBfI/AAAAAAAACyU/pYGy5j-onZAwr2bm1LZ1exExgasXVzHqwCLcB/s1600/033015-health-apples.png',
#                'http://saltmarshrunning.com/wp-content/uploads/2014/09/bananasf.jpg', 'http://www.sealdsweet.com/img/oranges.jpg',
#                'http://www.puraforceremedies.com/wp-content/uploads/2016/05/Strawberries.jpg', 'http://www.medicalnewstoday.com/content/images/articles/287/287710/blueberries.jpg',
#                'http://weknowyourdreams.com/image.php?pic=/images/pear/pear-02.jpg', 'https://www.organicfacts.net/wp-content/uploads/peach.jpg',
#                'http://freenology.com/images/71442946288pineapple.jpg', 'http://www.eatsxm.com/uploads/1/3/8/6/13862036/3554628_orig.jpg',
#                'http://cdn1.medicalnewstoday.com/content/images/articles/271156-grapes.jpg']

fruit_content = ['Apples are extremely rich in important antioxidants, flavanoids, and dietary fiber. The phytonutrients and antioxidants in apples may help reduce the risk of developing cancer, hypertension, diabetes, and heart disease. This article provides a nutritional profile of the fruit and its possible health benefits',
                 'Bananas are a great dietary source of potassium. One medium-sized banana (118 grams) contains 9% of the RDI. A potassium-rich diet can help lower blood pressure, and people who eat plenty of potassium have up to a 27% lower risk of heart disease (22, 23, 24, 25)',
                 'Oranges are an excellent source of vitamin C. They are also a very good source of dietary fiber. In addition, oranges are a good source of B vitamins including vitamin B1, pantothenic acid and folate as well as vitamin A, calcium, copper and potassium.',
                 'If you’re not already a fan of strawberries, you should be. Not only are they juicy, summery and delicious, they’re a bona fide superfood, too. Nutrient-rich and packed with antioxidants (like vitamin C), strawberries offer a wide range of health benefits, some of which may surprise you. (Wrinkle-prevention? Yes please!). Here are 10 reasons you should add more strawberries to your diet.',
                 'Blueberries are one of the most nutrient-dense foods in the world and contain large levels and a broad range of antioxidants. The ORAC score of blueberries is an incredible 9,621, which makes it one of the highest antioxidant foods in the world.',
                 'One pear contains up to 11 percent of our daily recommended intake of vitamin C and 9.5 percent of our daily recommended intake of copper. Pears are also said to have more nutrients per calorie than calorie per nutrient. Pears are an excellent source of dietary fiber, and fiber is good for the heart',
                 'Peaches store a broad range of nutrients that are vital for the healthy functioning of the body. Peaches are a rich provider of vitamin A, beta-carotene, and vitamin C (ascorbic acid). They are also a good source of vitamin E (alpha-tocopherol), vitamin K (phylloquinone), vitamin B1 (thiamine), vitamin B2 (riboflavin), vitamin B3 (niacin), vitamin B-6, folate, and pantothenic acid. Peaches also offer a rich treasure of minerals such as calcium, potassium, magnesium, iron, manganese, phosphorous, zinc, and copper. Peaches are low in calories, contain no saturated fat or cholesterol, and are a good source of dietary fiber.',
                 'Aside from the interesting story and appearance of this fruit, it is also a storehouse of huge health benefits due to its wealth of nutrients, vitamins, and minerals, including potassium, copper, manganese, calcium, magnesium, vitamin C, beta carotene,  thiamin, B6, and folate, as well as soluble and insoluble fiber, and bromelain.',
                 'Avocados are considered a “Super Food” and have a special position in the food calorie pyramid. Avocados are rich in various nutrients, vitamins and minerals. Avocados are also a good source of monounsaturated fatty acids, and they have a low sugar content.  They are a good source of energy and contain a number of essential vitamins and minerals. Avocados contain calcium, iron, magnesium, potassium, copper, manganese, phosphorus and zinc. They also contain minerals such as vitamin C, B6, B-12, A, D, K, E, thiamin, riboflavin, and niacin.',
                 'Grapes contain powerful antioxidants known as polyphenols, which may slow or prevent many types of cancer, including esophageal, lung, mouth, pharynx, endometrial, pancreatic, prostate and colon. The resveratrol found in red wine famous for heart health is a type of polyphenol found in the skins of red grapes',
                 'Cranberries are one of the top antioxidant-rich foods, packing in more antioxidants ounce-for-ounce than other superfoods, such as spinach, blueberries, or even green tea Many of these phytonutrients offer antioxidant, anti-inflammatory, and anti-cancer health benefits. Cranberries are a very good source of vitamin C, dietary fiber, and manganese, as well as a good source of vitamin E, vitamin K, copper and pantothenic acid.',
                 'The health benefits of lemons are due to its many nourishing elements like vitamin C, vitamin B6, vitamin A, vitamin E, folate, niacin thiamin, riboflavin, pantothenic acid, copper,  calcium, iron,  magnesium, potassium, zinc, phosphorus and protein. Lemon is a fruit that contains flavonoids, which are composites that contain antioxidant and cancer fighting properties. It helps to prevent diabetes, constipation, high blood pressure, fever, indigestion and many other problems, as well as improving the skin, hair, and teeth.',
                 'The many health benefits of tomatoes can be attributed to their wealth of nutrients and vitamins, including an impressive amount of vitamin A, vitamin C, and vitamin K, as well as significant amounts of vitamin B6, folate, and thiamin. Tomatoes are also a good source of potassium, manganese, magnesium, phosphorous, and copper. Tomatoes also have dietary fiber and protein, as well as a number of organic compounds like lycopene that also contribute to the overall health benefits that tomatoes can confer to our health!',
                 'Low in fat and even lower in cholesterol, spinach is high in niacin and zinc, as well as protein, fiber, vitamins A, C, E and K, thiamin, vitamin B6, folate, calcium, iron, magnesium, phosphorus, potassium, copper, and manganese. In other word, it’s loaded with good things for every part of your body! Abundant flavonoids in spinach act as antioxidants to keep cholesterol from oxidizing and protect your body from free radicals, particularly in the colon. The folate in spinach is good for your healthy cardiovascular system, and magnesium helps lower high blood pressure. Studies also have shown that spinach helps maintain your vigorous brain function, memory and mental clarity.']
counter = 0
13.times do
  Produce.create(
    name: fruit[counter],
    expires_in: Faker::Number.between(5, 14),
    image: File.open(File.join(Rails.root, fruit_image[counter])),
    kind: "fruit",
    content: fruit_content[counter]
  )
  counter += 1
end

veg = ["Lettuce", "Broccoli", "Kale", "Onion", "Potato", "Cucumber", "Carrots", "Celery", "Peppers", "Cabbage", "Beets", "Ginger", "Spinach"]
# veg_image = ['http://www.continentalenterprisesinc.com/products/vegetables/lettuce_1.png', 'http://www.medicalnewstoday.com/content/images/articles/266/266765/two-heads-of-broccoli.jpg',
#              'http://www.discoverkale.co.uk/wp-content/uploads/2014/12/kale_title.jpg', 'http://www.petpoisonhelpline.com/wp-content/uploads/2011/10/Onion.jpg',
#              'http://cdn1.medicalnewstoday.com/content/images/articles/280/280579/potatoes.jpg', 'http://www.livescience.com/images/i/000/076/219/original/cucumbers.jpg?interpolation=lanczos-none&downsize=*:1000',
#              'https://woolworthsbabyandtoddlerclub.com.au/images/imageLibrary/will-carrots-really-help-my-babys-eyesight-454.jpg', 'https://draxe.com/wp-content/uploads/2015/04/bigstock-Fresh-green-celery-isolated-on-52080031.jpg',
#              'http://www.finecooking.com/assets/uploads/posts/5086/ING-bell-pepper_sql.jpg', 'http://www.medicalnewstoday.com/content/images/articles/284/284823/cabbage.jpg']

veg_image = ["app/assets/images/lettuce.jpg", "app/assets/images/broccoli.jpg", "app/assets/images/kale.jpg", "app/assets/images/Onion.jpg", "app/assets/images/potatoes.jpg", "app/assets/images/cucumbers.jpg",
             "app/assets/images/carrots.jpg", "app/assets/images/celery.jpg", "app/assets/images/peppers.jpg", "app/assets/images/cabbage.jpg", "app/assets/images/beets.jpg", "app/assets/images/ginger.jpg", "app/assets/images/spinach.jpg"]

veg_content = ['Lettuce contains moisture, energy, protein, fat, carbohydrates, dietary fiber, and sugars. The minerals and vitamins found in lettuce include calcium, iron, magnesium, phosphorous, potassium, sodium, zinc along with vitamins like thiamin, riboflavin, niacin, folate, vitamin B-6, C, A, E, and vitamin K.',
               'Broccoli is an excellent source of vitamin K, vitamin C, chromium and folate. It is a very good source of dietary fiber, pantothenic acid, vitamin B6, vitamin E, manganese, phosphorus, choline, vitamin B1, vitamin A (in the form of carotenoids), potassium and copper.',
               'Kale is a very good source of vitamin B6, dietary fiber, calcium, potassium, vitamin E, vitamin B2, iron, magnesium, vitamin B1, omega-3 fatty acids phosphorus, protein, folate, and niacin',
               'Onions have so many valuable medicinal applications because of the nutrients, vitamins, minerals, and organic compounds contained in them, including the presence of sulfuric compounds and quercetin in traces of the essential oils. They also contain mineral components such as calcium, magnesium, sodium, potassium, selenium and phosphorus, and they are a good source of vitamin C, vitamin B6, and dietary fiber!',
               'The reason that potatoes have spread across the globe so quickly and has been so widely accepted is because they are a storehouse of energy and nutrition, including vitamins, minerals, and essential organic compounds.',
               'Cucumber benefits range from preventing acidity to keeping skin well-toned. Cucumber has high alkaline levels, thus regulating the body’s blood pH and neutralizing acidity',
               'The health benefits of carrot include reduced cholesterol, prevention from heart attacks, warding off certain cancers and many others. Most of the benefits of carrot can be attributed to its beta carotene and fiber content. This root, which has a scientific name of Daucus Carota, is a good source of antioxidant agents as well. Carrots are rich in vitamin A, Vitamin C, Vitamin K, and potassium.',
               'Health benefits of celery are – they are rich in vitamin C, they lower cholesterol, prevent cancer, reduce high blood pressure, and promote health.',
               'The highest amount of Vitamin C in a bell pepper is concentrated in the red variety. Red bell peppers contain several phytochemicals and carotenoids, particularly beta-carotene, which lavish you with antioxidant and anti-inflammatory benefits. The capsaicin in bell peppers has multiple health benefits',
               'Cabbage is a very good source of manganese, dietary fiber, potassium, vitamin B1, folate and copper. Additionally, cabbage is a good source of choline, phosphorus, vitamin B2, magnesium, calcium, selenium, iron, pantothenic acid, protein and niacin.',
               'Beets are high in immune-boosting vitamin C, fiber, and essential minerals like potassium (essential for healthy nerve and muscle function) and manganese (which is good for your bones, liver, kidneys, and pancreas). Beets also contain the B vitamin folate, which helps reduce the risk of birth defects.',
               'Ginger is a common ingredient in Asian and Indian cuisine. However, ginger has been used for its medicinal properties for centuries among many cultures. It has a long history of use for relieving digestive problems such as nausea, loss of appetite, motion sickness and pain.']
counter = 0
13.times do
  Produce.create(
    name: veg[counter],
    expires_in: Faker::Number.between(5, 14),
    image: File.open(File.join(Rails.root, veg_image[counter])),
    kind: "veggie",
    content: veg_content[counter]
  )
  counter += 1
end

Juice.create(user_id: 1, name: "Beet Frappe", juice_produce_attributes: [{produce_id: 1, quantity: 1}, {produce_id: 20, quantity: 4}, {produce_id: 24, quantity: 1}])
Juice.create(user_id: 2, name: "Carrot Apple", juice_produce_attributes: [{produce_id: 1, quantity: 1}, {produce_id: 20, quantity: 5}])
Juice.create(user_id: 3, name: "Grape Ape", juice_produce_attributes: [{produce_id: 1, quantity: 2}, {produce_id: 10, quantity: 10}, {produce_id: 7, quantity: 1}])
Juice.create(user_id: 4, name: "Sweet Detox", juice_produce_attributes: [{produce_id: 1, quantity: 1}, {produce_id: 16, quantity: 4}, {produce_id: 19, quantity: 2}, {produce_id: 21, quantity: 4}, {produce_id: 25, quantity: 1}])
Juice.create(user_id: 5, name: "Delicate Pale", juice_produce_attributes: [{produce_id: 21, quantity: 4}, {produce_id: 6, quantity: 2}])
Juice.create(user_id: 6, name: "Tomorange", juice_produce_attributes: [{produce_id: 1, quantity: 1}, {produce_id: 20, quantity: 5}])
Juice.create(user_id: 7, name: "Cranapple", juice_produce_attributes: [{produce_id: 1, quantity: 3}, {produce_id: 11, quantity: 10}, {produce_id: 10, quantity: 10}])
Juice.create(user_id: 8, name: "Apple Zing", juice_produce_attributes: [{produce_id: 1, quantity: 3}, {produce_id: 20, quantity: 2}, {produce_id: 25, quantity: 1}])
Juice.create(user_id: 9, name: "Beetles", juice_produce_attributes: [{produce_id: 24, quantity: 2}, {produce_id: 1, quantity: 2}, {produce_id: 21, quantity: 3}])
Juice.create(user_id: 10, name: "Veggie Cocktail", juice_produce_attributes: [{produce_id: 21, quantity: 3}, {produce_id: 13, quantity: 3}, {produce_id: 20, quantity: 2}, {produce_id: 12, quantity: 1}])
Juice.create(user_id: 10, name: "Ginger Zinger", juice_produce_attributes: [{produce_id: 8, quantity: 1}, {produce_id: 2, quantity: 2}, {produce_id: 12, quantity: 1}])
Juice.create(user_id: 1, name: "Pinapple Basic", juice_produce_attributes: [{produce_id: 8, quantity: 1}, {produce_id: 1, quantity: 1}, {produce_id: 20, quantity: 3}, {produce_id: 21, quantity: 1}])
Juice.create(user_id: 10, name: "Veggie Cocktail", juice_produce_attributes: [{produce_id: 21, quantity: 3}, {produce_id: 13, quantity: 3}, {produce_id: 20, quantity: 2}, {produce_id: 12, quantity: 1}])
Juice.create(user_id: 5, name: "Cool and Pale", juice_produce_attributes: [{produce_id: 19, quantity: 1}, {produce_id: 1, quantity: 2}])
