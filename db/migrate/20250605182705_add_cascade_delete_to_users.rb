class AddCascadeDeleteToUsers < ActiveRecord::Migration[5.2]
 def change
    remove_foreign_key :users, :companies
    add_foreign_key :users, :companies, on_delete: :cascade
  end
end
