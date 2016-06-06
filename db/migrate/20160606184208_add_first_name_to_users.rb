class AddFirstNameToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :first_name, :string #add new column to the table users.
  	# sometimes is neccesary to add an index to the column for performance. With an index, a query is faster. Think of 
  	# an index book.
  end
end
