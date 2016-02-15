class CreateAns < ActiveRecord::Migration
  def self.up
    create_table :gg_ans do |t|
    	t.column :gg_article_id, :integer
    	t.column :priority, :string
    	t.column :description, :text
    end
  end

  def self.down
    drop_table :gg_ans
  end
end