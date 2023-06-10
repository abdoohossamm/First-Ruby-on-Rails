class Post < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true

  after_save { Rails.cache.write("post_#{id}", self) }
  after_destroy { Rails.cache.delete("post_#{id}") }

  def cache_key
    [super, updated_at.to_i].join('-')
  end
end