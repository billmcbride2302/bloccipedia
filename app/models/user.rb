class User < ActiveRecord::Base
  has_many :wikis 
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  enum role: [:standard, :admin, :premium] 

  devise :confirmable, :database_authenticatable, :registerable, 
         :recoverable, :rememberable, :trackable, :validatable

  after_initialize :set_default_role 

  def set_default_role
    self.role ||= :standard
  end

end



