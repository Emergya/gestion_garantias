class RemoveGuaranteeToGgArticles < ActiveRecord::Migration
  def self.up
    remove_column :gg_articles, :guarantee_start
    remove_column :gg_articles, :guarantee_end
  end

  def self.down
    add_column :gg_articles, :guarantee_start, :datetime, null: true
    add_column :gg_articles, :guarantee_end, :datetime, null: true
  end
end
