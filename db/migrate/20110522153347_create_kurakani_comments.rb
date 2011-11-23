class CreateKurakaniComments < ActiveRecord::Migration
  def change
    create_table :kurakani_comments do |t|
      t.text :content
      t.text :rendered_content
      t.references :user
      t.references :commentable, :polymorphic => true

      t.timestamps  
    end
    
    add_index :kurakani_comments, :user_id
    add_index :kurakani_comments, [:commentable_id, :commentable_type]
    
  end
end
