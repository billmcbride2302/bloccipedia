# class User < ActiveRecord::Base
#   has_many :wikis 
#   # Include default devise modules. Others available are:
#   # :confirmable, :lockable, :timeoutable and :omniauthable
#   enum role: [:standard, :admin, :premium] 

#   devise :confirmable, :database_authenticatable, :registerable, 
#          :recoverable, :rememberable, :trackable, :validatable

#   after_initialize :set_default_role 

#   def set_default_role
#     self.role ||= :standard
#   end

# end

# # ApplicationRecord


class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  has_many :wikis

  before_save { self.email = email.downcase }

  enum role: [:standard, :admin, :premium]
  after_initialize { self.role ||= :standard }

end