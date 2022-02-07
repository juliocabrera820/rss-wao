class CreateNews < ActiveRecord::Migration[6.0]
  def change
    create_table :news do |t|
      t.string :title
      t.string :description
      t.string :url
      t.datetime :published

      t.timestamps
    end
  end
end
