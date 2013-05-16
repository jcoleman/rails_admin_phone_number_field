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
            :form_phone_number_field
          end

          register_instance_option :number_format do
            :international
          end

          register_instance_option :default_value do
            nil
          end

          register_instance_option :formatted_value do
            formattable = value
            if formattable
              formattable.phony_formatted(:format => number_format, :spaces => '.') rescue formattable
            else
              "".html_safe
            end
          end

          register_instance_option :pretty_value do
            formatted_value.presence || ' - '
          end

          # output for printing in export view (developers beware: no bindings[:view] and no data!)
          register_instance_option :export_value do
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
