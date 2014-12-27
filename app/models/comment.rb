class Comment < ActiveRecord::Base
  default_scope -> { order(created_at: :desc) }
  belongs_to :link

  validates :author, presence => true
  validates :body, presence => true
end
