class ShopsController < ApplicationController

  def index
    if params[:publisher_id]
      #getting all publisher's shops...
      # publisher_list_of_shops = Publisher.find(params[:id]).shops.includes(:copies).order("copies_sold DESC").uniq #including associate model copies and ordering by copies_sold attribute in descending order, and removing duplicate values with uniq...
      # publisher_list_of_shops = Publisher.find(params[:id]).shops.includes(:copies).order("books_sold_count DESC").distinct #including associate model copies and ordering by copies_sold attribute in descending order, and removing duplicate values with uniq...
      publisher_list_of_shops = Publisher.find(params[:publisher_id]).shops.order("books_sold_count DESC").distinct #including associate model copies and ordering by copies_sold attribute in descending order, and removing duplicate values with uniq...
      # publisher_list_of_shops = Publisher.find(params[:id]).shops.order("books_sold_count DESC").includes(:copies).uniq #including associate model copies and ordering by copies_sold attribute in descending order, and removing duplicate values with uniq...
      # publisher_list_of_shops = Publisher.find(params[:id]).shops.order("books_sold_count DESC").distinct #including associate model copies and ordering by copies_sold attribute in descending order, and removing duplicate values with uniq...
      render json: publisher_list_of_shops, publisher_id: params[:id], root: 'shops', adapter: :json #passing publisher_id (pub_id) as instance_option to shop_serializer

      # render json: shops
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

#Endpoint 1
#  for a specific Publisher it should return the list of shops selling at least one book of that publisher.
# NOTE: publisher.shops accomplishes this...

#  Shops should be ordered by the number of books sold.
# NOTE: assuming books_sold_count means a particular publisher's sold books...

#  Each shop should include the list of Publisher’s books that are currently in stock.
