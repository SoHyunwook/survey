# This migration comes from rapidfire (originally 20130502170733)
class CreateRapidfireQuestionGroups < ActiveRecord::Migration
  def change
    create_table :rapidfire_question_groups do |t|
      t.string  :name
      t.string  :writer
      # t.integer :user_id

      t.timestamps
    end
  end
end
