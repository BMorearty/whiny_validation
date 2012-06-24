require "whiny_validation/version"

module WhinyValidation
  extend ActiveSupport::Concern

  included do
    after_validation :whiny_validation, :if => proc { |m| m.errors }
  end

  def whiny_validation
    Rails.logger.debug "Validation failed for #{inspect}:\n#{errors.full_messages.map{|m|"  #{m}"}.join("\n")}"
  end
end

module ActiveRecord::Base
  include WhinyValidation
end
