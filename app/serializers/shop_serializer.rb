class ShopSerializer < ActiveModel::Serializer
  attributes :id,
            :name,
            :books_sold_count,
            :books_in_stock #calling function below to change name of this attribute

            def books_in_stock
              object.books_in_stocks.map do |eachBookInStock|
                {
                    id: eachBookInStock.book.id, #showing book id, instead of books_in_stock id (AKA book copy)
                    title: eachBookInStock.book.title,
                    copies_in_stock: eachBookInStock.copies_in_stock
                }
              end
            end

end
