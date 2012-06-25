require "whiny_validation/version"

module WhinyValidation
  extend ActiveSupport::Concern

  included do
    after_validation :whiny_validation, :if => proc { |m| m.errors.present? }
  end

  def whiny_validation
    ActiveSupport::Notifications.instrument("validation_failed.whiny_validation",
                                            :object => self,
                                            :error_messages => errors.full_messages)
  end

  class LogSubscriber < ActiveSupport::LogSubscriber
    def validation_failed(event)
      name = color("Validation failed", YELLOW, true)
      object = event.payload[:object]
      error_messages = color(event.payload[:error_messages].map{|m|"    => #{m}"}.join("\n"), YELLOW)

      debug "  #{name}  #{object.inspect}\n#{error_messages}"
    end
  end
end

WhinyValidation::LogSubscriber.attach_to :whiny_validation

module ActiveRecord
  class Base
    include WhinyValidation
  end
end
