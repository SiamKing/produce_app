1. Render at least one index page via jQuery and an Active Model Serialization JSON Backend.
  - Possible index pages
    a. Users juices or Users produce on users show page. Quick look button.

2. Render at least on show page via jQuery and JSON.
  - on juice/produce show page have next buttons to show next produce/juice without page refresh

3. The rails API must reveal at least one has-many relationship in the JSON that is then rendered to the page. For example if each of those posts has many comments, you could render those comments as well on that show page.
  - maybe the ingredients (produce) used in the juices

4. Must use your Rails API and a form to create a resource and render the response without a page refresh. For example, a user might be able to add a comment to a post, and the comment would be serialized, and submitted via an AJAX POST request, with the response being the new object in JSON and then appending that new comment to the DOM.
  - Maybe add comments to Juices. Add a comment form to each juice show page and submit it via ajax post request, then get the response back and append to the DOM.

5. Must translate the JSON responses into Javascript Model Objects. The Model Objects must have at least one method on the prototype. Formatters work really well for this.
Borrowing from the previous example, instead of plainly taking the JSON response of the newly created comment and appending it to the DOM, you would create a Comment prototype object and add a function to that prototype to perhaps concatenate (format) the comments authors first and last name. You would then use the object to append the comment information to the DOM.
