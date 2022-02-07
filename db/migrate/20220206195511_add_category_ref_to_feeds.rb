class AddCategoryRefToFeeds < ActiveRecord::Migration[6.0]
  def change
    add_reference :feeds, :category, null: false, foreign_key: true
  end
end
