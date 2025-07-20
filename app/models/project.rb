class Project < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :url, presence: true, format: URI::regexp(%w[http https])
  validates :github, presence: true, format: URI::regexp(%w[http https])
  validates :tags, presence: true

  # Simple scopes
  scope :recent, -> { order(created_at: :desc) }

  # Method to add tags
  def add_tag(tag)
    self.tags ||= []
    self.tags << tag unless self.tags.include?(tag)
  end

  # Method to remove tags
  def remove_tag(tag)
    self.tags ||= []
    self.tags.delete(tag)
  end
end