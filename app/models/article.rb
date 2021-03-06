class Article < ActiveRecord::Base
  belongs_to :user
  validates :title, presence: true, length: { minimum: 5, maximum: 100 }
  validates :content, presence: true, length: { minimum: 50, maximum: 1000 }
  validates :user_id, presence: true
  validates :summary, presence: true, length: {minimum:10 , maximum: 40}
end