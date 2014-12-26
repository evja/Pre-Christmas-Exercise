class Link < ActiveRecord::Base
  default_scope -> { order(votes: :desc) }
  belongs_to :user, dependent: :destroy

  validates :user_id,      :presence => true
  validates :title,        :presence => true

end
