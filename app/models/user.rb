class User < ActiveRecord::Base
  
  has_many :question_groups, :class_name => 'Question_groups'
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
        
end
