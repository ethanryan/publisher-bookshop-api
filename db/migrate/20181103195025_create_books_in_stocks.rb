class CreateBooksInStocks < ActiveRecord::Migration[5.2]
  def change
    create_table :books_in_stocks do |t|
      t.integer :book_id
      t.integer :shop_id
      t.integer :copies_in_stock
      t.integer :copies_sold

      t.timestamps
    end
  end
end
