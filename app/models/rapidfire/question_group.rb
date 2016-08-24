module Rapidfire
  class QuestionGroup < ActiveRecord::Base
      
    belongs_to :user
    has_many   :questions
    
    validates  :user_id, :presence => true
    validates  :name, :presence => true
    validates  :writer, :presence => true
    self.per_page=10
    if Rails::VERSION::MAJOR == 3
      attr_accessible :user_id, :name, :writer
    end
  end
end