# README

Backend API endpoints for code challenge.

fork or clone this repo

run `bundle install`

run `rake db:create`

run `rake db:migrate`

run `rake db:seed`

Note: this app has the following routes:

resources :publishers, only: [:index, :show]
resources :publishers do
  resources :shops, only: [:index]
end
resources :shops, only: [:index, :show]
resources :books, only: [:index]

Note: shops#index will conditionally render publisher_shops_path if params[:publisher_id]

### Endpoint 1
publisher_shops -> /publishers/:publisher_id/shops
Challenge: for a specific Publisher it should return the list of shops selling at least one book of that publisher.
Shops should be ordered by the number of books sold.
Each shop should include the list of Publisher’s books that are currently in stock.

Example response:

![endpoint 1 pic](https://github.com/ethanryan/publisher-bookshop-api/blob/master/images/endpoint-1.png)

### Endpoint 2
shop -> /shops/:id
Challenge: for a specific Shop it should mark one or multiple copies of a book as sold.

Example response:

![endpoint 2 pic](https://github.com/ethanryan/publisher-bookshop-api/blob/master/images/endpoint-2.png)


xxx

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
