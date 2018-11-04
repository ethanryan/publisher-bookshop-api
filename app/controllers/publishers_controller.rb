class PublishersController < ApplicationController

  def index
    publishers = Publisher.all
    render json: publishers
  end

  def show
    #getting all publisher's shops...
    publisher_list_of_shops = Publisher.find(params[:id]).shops.includes(:copies).order("copies_sold DESC").uniq #including associate model copies and ordering by copies_sold attribute in descending order, and removing duplicate values with uniq...
    render json: publisher_list_of_shops, pub_id: params[:id] #passing publisher_id (pub_id) as instance_option to shop_serializer
  end

end


#Endpoint 1
#  for a specific Publisher it should return the list of shops selling at least one book of that publisher.
# NOTE: publisher.shops accomplishes this...

#  Shops should be ordered by the number of books sold.
# NOTE: assuming books_sold_count means a particular publisher's sold books...

#  Each shop should include the list of Publisher’s books that are currently in stock.
