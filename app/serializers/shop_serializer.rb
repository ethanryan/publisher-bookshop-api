class ShopSerializer < ActiveModel::Serializer
  attributes :id,
            :name,
            :books_sold_count,
            :books_in_stock #calling function below to change name of this attribute

            def books_in_stock
              if instance_options[:publisher_id] #if API endpoint is being called with a publisher_id...
                publisher_books_in_stock
              else
                shop_books_in_stock
              end
            end

            def select_books_by_publisher
              object.copies.select{|eachCopy| eachCopy.book.publisher.id === instance_options[:publisher_id].to_i}
            end

            def publisher_books_in_stock
              select_books_by_publisher.map do |eachCopy|
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
