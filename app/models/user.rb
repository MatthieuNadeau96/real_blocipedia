class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  has_many :wikis
  has_many :collaborators
  has_many :wikis, through: :collaborators
  
  
  
  before_save { self.role ||= :standard }
  enum role: [:standard, :premium, :admin]
  
  # private
  
  def going_public
    self.wikis.each { |wiki| puts wiki.publicize }
  end
end