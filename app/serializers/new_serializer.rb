class NewSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :url, :published, :category

  def category
    object.feed.category.name
  end

  def published
    object.published.to_formatted_s(:long_ordinal)
  end
end
