require "whiny_validation/version"
require "whiny_validation/configuration"

module WhinyValidation
  extend ActiveSupport::Concern

  included do
    after_validation :whiny_validation, :if => proc { |model| model.errors.present? }
  end

  def whiny_validation
    ActiveSupport::Notifications.instrument("validation_failed.whiny_validation",
                                            :object => self,
                                            :error_messages => errors.full_messages)
  end

  class LogSubscriber < ActiveSupport::LogSubscriber
    def validation_failed(event)
      send(WhinyValidation.configuration.log_level) do
        name = color("Validation failed", YELLOW, true)
        object = event.payload[:object]
        error_messages = color(event.payload[:error_messages].map{|message|"    => #{message}"}.join("\n"), YELLOW)

        "  #{name}  #{object.inspect}\n#{error_messages}"
      end
    end
  end

  WhinyValidation::LogSubscriber.attach_to :whiny_validation
end
