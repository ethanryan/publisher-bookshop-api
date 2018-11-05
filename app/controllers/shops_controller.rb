class ShopsController < ApplicationController

  def index
    if params[:publisher_id] #getting all publisher's shops...
      publisher_list_of_shops = Publisher.find(params[:publisher_id]).shops.where("books.publisher_id = '#{params[:publisher_id]}'").order("books_sold_count DESC").distinct
      render json: publisher_list_of_shops, publisher_id: params[:publisher_id], root: 'shops', adapter: :json #passing publisher_id (pub_id) as instance_option to shop_serializer
    else
      shops = Shop.all
      render json: shops
    end
  end

  def show
    shop = Shop.find(params[:id])
    render json: shop
  end

end

#Endpoint 1:
# publisher_shops -> /publishers/:publisher_id/shops
#  for a specific Publisher it should return the list of shops selling at least one book of that publisher.
# NOTE: publisher.shops accomplishes this...

#  Shops should be ordered by the number of books sold.
# NOTE: .order("books_sold_count DESC") above accomplishes this, books_sold_count is a shop's total sold books, not a particular publisher's...

#  Each shop should include the list of Publisher’s books that are currently in stock.
# NOTE: conditionally rendering this in shop_serializer
