# This migration comes from rapidfire (originally 20130502170733)
class CreateRapidfireQuestionGroups < ActiveRecord::Migration
  def change
    create_table :rapidfire_question_groups do |t|
      
      t.integer :user_id #user와 연결하는 FK
      
      t.string  :name
      t.string  :writer

      t.timestamps
    end
  end
end
