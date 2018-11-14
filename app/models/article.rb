class Article < ApplicationRecord
  has_many :comments, dependent: :destroy
  validates :title, presence: true, length: { minimum: 5, maximum: 240 }
  validates :text, presence: true
  belongs_to :author

  def summarize?
    !(text.empty? || text.split.size < 7)
  end

  def summary
    text if (words = text.split).size < 7 else words[0..7].join(" ") + "..."
  end
end
