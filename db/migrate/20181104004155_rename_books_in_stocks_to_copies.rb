class RenameBooksInStocksToCopies < ActiveRecord::Migration[5.2]
  def change
    rename_table :books_in_stocks, :copies
  end
end
