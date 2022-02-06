class AddFeedRefToNews < ActiveRecord::Migration[6.0]
  def change
    add_reference :news, :feed, null: false, foreign_key: true
  end
end
