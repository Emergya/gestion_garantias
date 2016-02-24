class CreateArticles < ActiveRecord::Migration
  def self.up
    create_table :gg_articles do |t|
      t.column :gg_file_id, :integer
    	t.column :code_article, :integer
      t.column :code_provider, :string
      t.column :name_provider, :string
      t.column :guarantee_start, :datetime, null: true
      t.column :guarantee_end, :datetime, null: true
    end
  end

  def self.down
    drop_table :gg_articles
  end
end
