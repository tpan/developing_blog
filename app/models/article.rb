class Article < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }
  
  before_save :set_slug
  
  def to_param
    return nil unless persisted?

    [id, slug].join('-')
  end

  private

  def set_slug
      self.slug = title.to_s.parameterize
  end
end
