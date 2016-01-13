class GgContact < ActiveRecord::Base
  unloadable
  
  belongs_to :gg_article

end
