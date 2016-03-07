class AddLevelToGgArticle < ActiveRecord::Migration
  def self.up
    add_column :gg_articles, :level_1, :integer
    add_column :gg_articles, :level_2, :integer
    add_column :gg_articles, :level_3, :integer
  end

  def self.down
    remove_column :gg_articles, :level_1
    remove_column :gg_articles, :level_2
    remove_column :gg_articles, :level_3
  end
end