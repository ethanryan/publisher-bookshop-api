# README

Backend API endpoints for code challenge.

fork or clone this repo

run `bundle install`

run `rake db:create`

run `rake db:migrate`

run `rake db:seed`

Note: this app has index and show routes for each model, and a nested route for publisher_shops. shops#index will conditionally render the publisher_shops_path if params[:publisher_id].

### Endpoint 1

Challenge: for a specific Publisher it should return the list of shops selling at least one book of that publisher.
Shops should be ordered by the number of books sold.
Each shop should include the list of Publisher’s books that are currently in stock.

Example response:

![endpoint 1 pic](https://github.com/ethanryan/publisher-bookshop-api/blob/master/images/endpoint-1.png)

publisher_shops route: /publishers/:publisher_id/shops

### Endpoint 2

Challenge: for a specific Shop it should mark one or multiple copies of a book as sold.

Example response:

![endpoint 2 pic](https://github.com/ethanryan/publisher-bookshop-api/blob/master/images/endpoint-2.png)

shop route: /shops/:id


To test endpoints individually:

run `rspec spec/requests/publisher_shops_spec.rb`

run `rspec spec/requests/shops_spec.rb`

To run all tests:

run `rspec`
