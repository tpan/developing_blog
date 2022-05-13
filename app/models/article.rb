class Article < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }

  def to_param
    return nil unless persisted?

    [id, slug].join('-')
  end
end
