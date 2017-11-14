class ChangeAnsForeignKeyType < ActiveRecord::Migration
  def self.up
    change_column :gg_ans, :gg_article_id, :string
  end

  def self.down
    change_column :gg_ans, :gg_article_id, :integer
  end
end
