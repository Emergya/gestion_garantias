class GgArticle < ActiveRecord::Base
  unloadable
  
  belongs_to :gg_file
  has_many :gg_contacts, :dependent => :destroy
  has_many :gg_ans, :class_name => 'GgAns', :dependent => :destroy
  accepts_nested_attributes_for :gg_contacts
  accepts_nested_attributes_for :gg_ans

  validates :code_article, :numericality => { :message => l(:"article.error.validation_code_article_number")}
  # validates :guarantee, :numericality => { :message => l(:"article.error.validation_guarantee_number")}
  # validates :ans, :numericality => { :message => l(:"article.error.validation_ans_number")}
  
  validate :code_article_is_blank
  validate :name_provider_is_blank
  # validate :guarantee_is_blank
  # validate :ans_is_blank
  validate :email_regexp
  validate :phone_regexp

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

  private
  # Valida que el código de articulo no se encuentre vacío.
  def code_article_is_blank
 	  errors.add :base, l(:"article.error.validation_code_article_blank") if self.code_article.blank?
  end

  # Valida que el nombre del proveedor no se encuentre vacío.
  def name_provider_is_blank
 	  errors.add :base, l(:"article.error.validation_name_provider_blank") if self.name_provider.blank?
  end

  # Valida que la garantía no se encuentre vacío.
  # def guarantee_is_blank
 	#   errors.add :base, l(:"article.error.validation_guarantee_blank") if self.guarantee.blank?
  # end

  # Valida que el ANS no se encuentre vacío.
  # def ans_is_blank
  #   errors.add :base, l(:"article.error.validation_ans_blank") if self.ans.blank?
  # end

  # Valida el email tenga la expresión regular correcta.
  def email_regexp
    validation_email = false

    (0..2).each do |i|
      if validation_email == false && !self.gg_contacts[i].email.blank? && /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/.match(self.gg_contacts[i].email).nil?
          errors.add :base, l(:"contact.error.validation_email_regexp") 
          validation_email = true
      end
    end
  end

  # Valida el número de teléfono tenga la expresión regular correcta:
  def phone_regexp
    validation_phone = false

    (0..2).each do |i|
      if validation_phone == false && !self.gg_contacts[i].phone.blank? && /^[0-9]{2,3}-? ?[0-9]{2} ?[0-9]{2} ?[0-9]{2}$/.match(self.gg_contacts[i].phone).nil?
         errors.add :base, l(:"contact.error.validation_phone_regexp") 
         validation_phone = true
      end
    end
  end

end
