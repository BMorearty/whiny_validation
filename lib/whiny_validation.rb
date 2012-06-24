require "whiny_validation/version"

module WhinyValidation
  extend ActiveSupport::Concern

  included do
    after_validation :whiny_validation, :if => proc { |m| m.errors.present? }
  end

  def whiny_validation
    logger.debug { "Validation failed for #{inspect}:\n#{errors.full_messages.map{|m|"  #{m}"}.join("\n")}" }
  end
end

module ActiveRecord
  class Base
    include WhinyValidation
  end
end
