class ChangeGgArticlesCodeArticle < ActiveRecord::Migration
  def self.up
    change_table :gg_articles do |t|
     t.change :code_article, :string
    end
  end

  def self.down
    change_table :gg_articles do |t|
     t.change :code_article, :integer
    end
  end
end
