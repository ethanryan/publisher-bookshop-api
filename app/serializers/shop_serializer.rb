class ShopSerializer < ActiveModel::Serializer
  attributes :id,
            :name,
            :books_sold_count,
            :books_in_stock #calling function below to change name of this attribute

            def books_in_stock
              # byebug
              object.copies
              .select{|eachBookInStock| eachBookInStock.book.publisher.id === instance_options[:pub_id].to_i} #getting publisher_id via instance_options from publishers_controller, to select only those books that were published by the publisher...
              .map do |eachBookInStock|
                {
                    id: eachBookInStock.book.id, #showing book id, instead of books_in_stock id (AKA book copy)
                    title: eachBookInStock.book.title,
                    copies_in_stock: eachBookInStock.copies_in_stock
                    # publisher_id: eachBookInStock.book.publisher.id #adding this for testing...
                }
              end
            end

end
