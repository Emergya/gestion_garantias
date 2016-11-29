class AddLotToGgArticle < ActiveRecord::Migration
  def self.up
    add_column :gg_articles, :lot, :string
  end

  def self.down
    remove_column :gg_articles, :lot
  end
end