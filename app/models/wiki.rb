class Wiki < ActiveRecord::Base
  belongs_to :user
  has_many :wikis
  
  validates :user, presence: true
  
  default_scope { order('created_at DESC') }
  
  scope :visible_to_login, -> (user) { user.admin? || user.premium? ? all : where(private: [false, nil])}
  scope :visible_to_all, -> {where(private: [false, nil])}
  
  def publicize
    update_attribute(:private, false)
  end
end
