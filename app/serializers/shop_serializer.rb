class ShopSerializer < ActiveModel::Serializer
  attributes :id,
            :name,
            :books_sold_count, #calling function below to get value for books_sold_count
            :books_in_stock #calling function below to change name of this attribute

            def books_sold_count
              # getting publisher_id via instance_options from publishers_controller, to select only those books that were published by the publisher...
              object.copies
              .select{|eachCopy| eachCopy.book.publisher.id === instance_options[:pub_id].to_i}
              .map{|eachCopy| eachCopy.copies_sold}.first #mapping over eachCopy's copies_sold data and returning that integer
            end

            def books_in_stock
              # byebug
              #getting publisher_id via instance_options from publishers_controller, to select only those books that were published by the publisher...
              object.copies
              .select{|eachCopy| eachCopy.book.publisher.id === instance_options[:pub_id].to_i}
              .map do |eachCopy|
                {
                    id: eachCopy.book.id, #showing book id, instead of books_in_stock id (AKA book copy)
                    title: eachCopy.book.title,
                    copies_in_stock: eachCopy.copies_in_stock
                    # publisher_id: eachCopy.book.publisher.id #adding this for testing...
                }
              end
            end

end
