class NewSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :url, :published, :category

  def category
    object.feed.category.name
  end
end
