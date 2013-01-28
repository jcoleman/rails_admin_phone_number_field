require "rails_admin_phone_number_field/engine"

module RailsAdminPhoneNumberField
end

require 'rails_admin/config/fields'
require 'rails_admin/config/fields/base'

module RailsAdmin
  module Config
    module Fields
      module Types
        class PhoneNumberField < RailsAdmin::Config::Fields::Base
          RailsAdmin::Config::Fields::Types::register(self)

          register_instance_option :partial do
            Rails.logger.debug "partial phone value"
            :form_phone_number_field
          end

          register_instance_option :number_format do
            :international
          end

          register_instance_option :default_value do
            Rails.logger.debug "default phone value"
            nil
          end

          register_instance_option :formatted_value do
            formattable = value
            Rails.logger.debug "formatting phone value: #{formattable}"
            if formattable
              formattable.phony_formatted(:format => number_format, :spaces => '.')
            else
              "".html_safe
            end
          end

          register_instance_option :pretty_value do
            Rails.logger.debug "pretty phone value"
            formatted_value.presence || ' - '
          end

          # output for printing in export view (developers beware: no bindings[:view] and no data!)
          register_instance_option :export_value do
            Rails.logger.debug "export phone value"
            pretty_value
          end

          register_instance_option :html_attributes do
            {:class => :"rails-admin-phone-number-field"}
          end
        end
      end
    end
  end
end

#RailsAdmin::Config::Fields.register_factory do |parent, properties, fields|
#  Rails.logger.debug "checking #{properties}"
#  if properties[:type] == :phone_number_field
#    fields << RailsAdmin::Config::Fields::Types::PhoneNumberField.new(parent, properties[:name], properties)
#    true
#  else
#    false
#  end
#end


