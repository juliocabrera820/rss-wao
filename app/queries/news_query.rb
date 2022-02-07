class NewsQuery
  def self.sort_by_field(field)
    New.all.order(field.to_sym)
  end

  def self.search(title)
    New.where('LOWER(title) LIKE LOWER(?)', "%#{title}%")
  end
end
