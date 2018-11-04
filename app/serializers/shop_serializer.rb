class ShopSerializer < ActiveModel::Serializer
  attributes :id,
            :name,
            :books_sold_count, #calling function below to get value for books_sold_count
            :books_in_stock #calling function below to change name of this attribute

            def books_sold_count
              if instance_options[:publisher_id] #if API endoing is being called with a publisher_id...
                publisher_books_sold_count
              else
                shop_books_sold_count
              end
            end

            def books_in_stock
              if instance_options[:publisher_id] #if API endpoint is being called with a publisher_id...
                publisher_books_in_stock
              else
                shop_books_in_stock
              end
            end

            def publisher_books_sold_count
              # getting publisher_id via instance_options from publishers_controller, to select only those books that were published by the publisher...
              object.copies
              .select{|eachCopy| eachCopy.book.publisher.id === instance_options[:publisher_id].to_i}
              .map{|eachCopy| eachCopy.copies_sold}.reduce( :+ ) #mapping over eachCopy's copies_sold data and reducing that array of numbers to its sum
            end

            def shop_books_sold_count
              object.copies.map{|eachCopy| eachCopy.copies_sold}.reduce( :+ ) #mapping over eachCopy's copies_sold data and reducing that array of numbers to its sum
            end

            def publisher_books_in_stock
              #getting publisher_id via instance_options from publishers_controller, to select only those books that were published by the publisher...
              object.copies
              .select{|eachCopy| eachCopy.book.publisher.id === instance_options[:publisher_id].to_i}
              .map do |eachCopy|
                {
                    id: eachCopy.book.id, #showing book id, instead of books_in_stock id (AKA book copy)
                    title: eachCopy.book.title,
                    copies_in_stock: eachCopy.copies_in_stock,
                    # copies_sold: eachCopy.copies_sold, #For a specific Shop it should mark one or multiple copies of a book as sold.
                    # publisher_id: eachCopy.book.publisher.id #adding this for testing...
                }
              end
            end

            def shop_books_in_stock
              object.copies.map do |eachCopy|
                {
                    id: eachCopy.book.id, #showing book id, instead of books_in_stock id (AKA book copy)
                    title: eachCopy.book.title,
                    copies_in_stock: eachCopy.copies_in_stock,
                    copies_sold: eachCopy.copies_sold, #For a specific Shop it should mark one or multiple copies of a book as sold.
                    publisher: eachCopy.book.publisher.name,
                }
              end
            end

end
