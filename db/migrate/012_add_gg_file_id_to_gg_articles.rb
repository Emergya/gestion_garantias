class AddGgFileIdToGgArticles < ActiveRecord::Migration
  def self.up
    add_column :gg_articles, :gg_file_id, :integer
  end

  def self.down
    remove_column :gg_articles, :gg_file_id
  end
end