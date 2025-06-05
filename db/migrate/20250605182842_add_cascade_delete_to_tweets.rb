class AddCascadeDeleteToTweets < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :tweets, :users
    add_foreign_key :tweets, :users, on_delete: :cascade
  end
end
