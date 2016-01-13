class CreateArticles < ActiveRecord::Migration
  def change
    create_table :gg_articles do |t|
        t.column :gg_file_id, :integer
      	t.column :code_article, :integer
        t.column :name_provider, :string
        t.column :guarantee_start, :datetime
        t.column :guarantee_end, :datetime
    end
  end

  def self.down
    drop_table :gg_articles
  end
end
