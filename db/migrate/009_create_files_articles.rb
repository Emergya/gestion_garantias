class CreateFilesArticles < ActiveRecord::Migration
  def self.up
    create_table :gg_files_articles, :id => false do |t|
     t.integer :gg_file_id
     t.integer :gg_article_id
    end
  end

  def self.down
    drop_table :gg_files_articles
  end
end
