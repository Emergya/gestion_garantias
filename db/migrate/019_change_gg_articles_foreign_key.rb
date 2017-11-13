class ChangeGgArticlesForeignKey < ActiveRecord::Migration
  def self.up
    rename_column :gg_articles, :gg_file_id, :gg_file_identity_file

    #execute "UPDATE gg_articles AS art LEFT JOIN gg_file AS file ON art.gg_file_identity_file = file.id SET art.gg_file_identity_file = file.identity_file;"
    

    # (SELECT file.identity_file FROM gg_files AS file WHERE file.id = id"
    # execute "INSERT INTO gg_contacts (level_1, level_2, level_3, id) SELECT level_1, level_2, level_3, article_id FROM gg_articles WHERE level_1 IS NOT NULL OR level_2 IS NOT NULL OR level_3 IS NOT NULL;"
  end

  def self.down
    rename_column :gg_articles, :gg_file_identity_file, :gg_file_id

    #execute "UPDATE gg_articles LEFT JOIN gg_contacts ON gg_articles.article_id = gg_contacts.article_id SET gg_articles.level_1=gg_contacts.level_1, gg_articles.level_2=gg_contacts.level_2, gg_articles.level_3=gg_contacts.level_3 WHERE gg_contacts.id IS NOT NULL"

  end
end
