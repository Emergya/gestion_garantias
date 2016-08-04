class AddMaterialAndNameArticleToGgArticles < ActiveRecord::Migration
  def self.up
    add_column :gg_articles, :code_type_material, :integer
    add_column :gg_articles, :type_material, :string
    add_column :gg_articles, :name_article, :string
  end

  def self.down
    remove_column :gg_articles, :code_type_material
    remove_column :gg_articles, :type_material
    remove_column :gg_articles, :name_article
  end
end