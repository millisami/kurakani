class CreateKurakaniComments < ActiveRecord::Migration
  def change
    create_table :kurakani_comments do |t|
      t.text :content
      t.text :rendered_content
      t.integer :user_id
      t.integer :commentable_id
      t.string  :commentable_type

      t.timestamps  
    end
    
    add_index :kurakani_comments, :user_id
    add_index :kurakani_comments, [:commentable_id, :commentable_type]
    
  end
end
