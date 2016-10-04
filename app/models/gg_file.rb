class GgFile < ActiveRecord::Base
  unloadable

  has_and_belongs_to_many :gg_articles, :join_table => :gg_files_articles

  validate :identity_file_is_blank
  validate :identity_file_is_number
  validate :identity_file_is_unique
  validate :code_file_is_blank

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
  # Valida que el campo del numero de identidad del expediente no se encuentre vacio.
  def identity_file_is_blank
  	 errors.add :base, l(:"file.error.validation_indentity_file_blank") if self.identity_file.blank?
  end

  # Valida que el identificador del expediente es un número
  def identity_file_is_number
    errors.add :base, l(:"file.error.validation_identity_file_number") if (self.identity_file.is_a? Integer) == false
  end

  # Valida que el identificador de expediente sea un número único.
  def identity_file_is_unique
    errors.add :base, l(:"file.error.validation_identity_file_unique") if GgFile.where("identity_file = ?", self.identity_file).present?
  end

  # Valida que el campo del código del expediente no este vacio.
  def code_file_is_blank
     errors.add :base, l(:"file.error.validation_code_file_blank") if self.code_file.blank?
  end

end
