# This migration comes from rapidfire (originally 20130502195415)
class CreateRapidfireAnswerGroups < ActiveRecord::Migration
  def change
    create_table :rapidfire_answer_groups do |t|
      # t.integer :user_id #답변한 user 저장
      
      t.references :question_group
      t.references :user, polymorphic: true

      t.timestamps
    end
    add_index :rapidfire_answer_groups, :question_group_id
    add_index :rapidfire_answer_groups, [:user_id, :user_type]
  end
end
