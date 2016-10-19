# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [x] Include at least one has_many relationship (x has_many y e.g. User has_many Recipes)
    - Users has_many Juices
- [x] Include at least one belongs_to relationship (x belongs_to y e.g. Post belongs_to User)
    - Juices belongs_to Users
- [x] Include at least one has_many through relationship (x has_many y through z e.g. Recipe has_many Items through Ingredients)
    - Users has_many produce through user_produce and vice versa
- [x] The "through" part of the has_many through includes at least one user submittable attribute (attribute_name e.g. ingredients.quantity)
    - Juices has_many Produce through juice_produce. juice_produce.quantity is the attribute
- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
    - I included validations on all models for name (presence and uniqueness).The user model has the most validations.
- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
    - Produce.faves  URL: /users/:id/produce/index (I used the same route to keep it DRY. I added a helper to keep the controller clean. For example, if the Produce index action received params with a user_id, then it came from the faves link with user_id included.)
- [x] Include a nested form writing to an associated model using a custom attribute writer (form URL, model name e.g. /recipe/new, Item)
    - users/:id/juices/new, Juice
- [x] Include signup (how e.g. Devise)
    - Devise
- [x] Include login (how e.g. Devise)
    - Devise
- [x] Include logout (how e.g. Devise)
    - Devise
- [x] Include third party signup/login (how e.g. Devise/OmniAuth)
    - Omniauth-facebook
- [x] Include nested resource show or index (URL e.g. users/2/recipes)
    - There are a couple: produce/:id/juices (shows juices made with particular produce), users/:id/juices (shows juices created by particular user)
- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients)
    - users/:id/juices/new
- [x] Include form display of validation errors (form URL e.g. /recipes/new)
    - /users/signup

Confirm:
- [x] The application is pretty DRY
- [x] Limited logic in controllers
- [x] Views use helper methods if appropriate
- [x] Views use partials if appropriate
