class CreateGgContactsForArticleContacts < ActiveRecord::Migration
  def self.up
    add_column :gg_articles, :article_id, :string

    create_table :gg_contacts do |t|
      t.column :level_1, :integer
      t.column :level_2, :integer
      t.column :level_3, :integer
      t.column :article_id, :string
    end

    add_index :gg_articles, :article_id
    add_index :gg_contacts, :article_id

    remove_column :gg_articles, :level_1
    remove_column :gg_articles, :level_2
    remove_column :gg_articles, :level_3
  end

  def self.down
    add_column :gg_articles, :level_1, :integer
    add_column :gg_articles, :level_2, :integer
    add_column :gg_articles, :level_3, :integer

    execute "UPDATE gg_articles LEFT JOIN gg_contacts ON gg_articles.article_id = gg_contacts.article_id SET gg_articles.level_1=gg_contacts.level_1, gg_articles.level_2=gg_contacts.level_2, gg_articles.level_3=gg_contacts.level_3 WHERE gg_contacts.id IS NOT NULL"

    drop_table :gg_contacts
    remove_column :gg_articles, :article_id
  end
end
