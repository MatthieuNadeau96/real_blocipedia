class Wiki < ActiveRecord::Base
  belongs_to :user
  has_many :wikis
  
  validates :user, presence: true
  
  default_scope { order('created_at DESC') }
  
  scope :visible_to, -> (user) { user ? all : where(private: false) }
  
  def publicize
    update_attribute(:private, false)
  end
end
