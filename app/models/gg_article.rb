class GgArticle < ActiveRecord::Base
  unloadable
  
  belongs_to :gg_file
  has_many :gg_contacts, :dependent => :destroy
  has_many :gg_ans, :class_name => 'GgAns', :dependent => :destroy
  accepts_nested_attributes_for :gg_ans

  belongs_to :first_level, :class_name => 'User', :foreign_key => :level_1
  belongs_to :second_level, :class_name => 'User', :foreign_key => :level_2
  belongs_to :third_level, :class_name => 'User', :foreign_key => :level_3

  validates :code_article, :numericality => { :message => l(:"article.error.validation_code_article_number")}
  validate :code_article_is_blank
  validate :code_provider_is_blank
  validate :name_provider_is_blank


  def users
    [first_level,second_level,third_level]
  end

  # Genera mensaje de error
  def get_error_message
    error_msg = ""
    self.errors.full_messages.each do |msg|
      if error_msg != ""
        error_msg << "<br>"
      end
      error_msg << msg
    end

    error_msg
  end

  # Muestra los contactos del articulo en el dialog.
  def show_contacts
    if self.users[0].nil? && self.users[1].nil? && self.users[2].nil?
      "<i>"+l(:"contact.empty")+"</i><br><hr>"
    else
      self.users.reject{|c| c.nil?}.collect{|c| "<div style='float: left; width: 200px'><b>"+c.firstname+" "+c.lastname+"</b></div> <div style='float: left; width: 250px; margin-left: 10px;'> <i>"+c.mail+"</i></div> | "+(c.phone.present? ? c.phone : "Sin número de contacto.")+" | <hr>"}.join('')
    end
  end

  private
  # Valida que el código de articulo no se encuentre vacío.
  def code_article_is_blank
 	  errors.add :base, l(:"article.error.validation_code_article_blank") if self.code_article.blank?
  end
  
  # Valida que el código del proveedor no se encuentre vacío.
  def code_provider_is_blank
    errors.add :base, l(:"article.error.validation_code_provider_blank") if self.code_provider.blank?
  end

  # Valida que el nombre del proveedor no se encuentre vacío.
  def name_provider_is_blank
 	  errors.add :base, l(:"article.error.validation_name_provider_blank") if self.name_provider.blank?
  end

end
