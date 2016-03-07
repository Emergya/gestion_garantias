require_dependency 'user'
require 'dispatcher' unless Rails::VERSION::MAJOR >= 3

module GG
  module UserPatch
    def self.included(base) # :nodoc:
      base.extend(ClassMethods)
      base.send(:include, InstanceMethods)

      # Same as typing in the class
      base.class_eval do
        unloadable # Send unloadable so it will be reloaded in development

        has_many :first_level, :foreign_key => :level_1, :class_name => 'GgArticle'
        has_many :second_level, :foreign_key => :level_2, :class_name => 'GgArticle'
        has_many :third_level, :foreign_key => :level_3, :class_name => 'GgArticle'

      end
    end

    module ClassMethods

    end

    module InstanceMethods
      def articles
      	first_level + second_level + third_level
      end

      def phone
      	cv = self.custom_values.where("custom_field_id = ?", Setting.plugin_gestion_garantias[:gg_field_user_phone])
      	if cv.present?
      	  cv.first.value
      	else
      	  nil
      	end
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
    end
  end
end
if Rails::VERSION::MAJOR >= 3
  ActionDispatch::Callbacks.to_prepare do
    # use require_dependency if you plan to utilize development mode
    User.send(:include, GG::UserPatch)
  end
else
  Dispatcher.to_prepare do
    User.send(:include, GG::UserPatch)
  end
end