class CreateCommentVotes < ActiveRecord::Migration
  def change
    create_table :comment_votes do |t|
      t.references :user
      t.references :comment
      t.boolean :vote, default: false
    end
  end
end
