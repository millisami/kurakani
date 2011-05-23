class CreateKurakaniComments < ActiveRecord::Migration
  def change
    create_table :kurakani_comments do |t|
      t.text :content
      t.text :raw_content
      t.integer :user_id
      t.integer :post_id

      t.timestamps
    end
  end
end
