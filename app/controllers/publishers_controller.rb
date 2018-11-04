class PublishersController < ApplicationController

  def index
    publishers = Publisher.all
    render json: publishers
  end

  def show
    publisher = Publisher.find(params[:id]).shops #getting all publisher's shops...
    render json: publisher, pub_id: params[:id] #passing publisher_id (pub_id) as instance_option to shop_serializer
  end

end


#Endpoint 1
#  for a specific Publisher it should return the list of shops selling at least one book of that publisher.
# NOTE: publisher.shops accomplishes this...

#  Shops should be ordered by the number of books sold.
#  Each shop should include the list of Publisher’s books that are currently in stock.
