class Wiki < ActiveRecord::Base
  belongs_to :user
  has_many :wikis
  
  validates :user, presence: true
  
  default_scope { order('created_at DESC') }
end
