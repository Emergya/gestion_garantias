class DropTableGgFilesArticles < ActiveRecord::Migration
  def self.up
    drop_table :gg_files_articles
  end

  def self.down
    create_table :gg_files_articles, :id => false do |t|
     t.integer :gg_file_id
     t.integer :gg_article_id
    end 
  end
end