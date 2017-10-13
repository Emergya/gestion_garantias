class GgContact < ActiveRecord::Base
  unloadable
  
  belongs_to :gg_article

  belongs_to :first_level, :class_name => 'User', :foreign_key => :level_1
  belongs_to :second_level, :class_name => 'User', :foreign_key => :level_2
  belongs_to :third_level, :class_name => 'User', :foreign_key => :level_3

  validates :article_id, presence: true
end
