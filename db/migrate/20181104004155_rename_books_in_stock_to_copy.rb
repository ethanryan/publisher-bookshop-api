class RenameBooksInStockToCopy < ActiveRecord::Migration[5.2]
  def change
    rename_table :books_in_stock, :copy
  end
end
