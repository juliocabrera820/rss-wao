class New < ApplicationRecord
  belongs_to :feed

  before_create :remove_html_tags

  private

  def remove_html_tags
    re = /<("[^"]*"|'[^']*'|[^'">])*>/
    description.gsub!(re, '')
  end
end
