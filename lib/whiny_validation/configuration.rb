module WhinyValidation
  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield configuration
  end

  class Configuration
    attr_accessor :log_level

    def initialize
      @log_level = :debug
    end
  end
end
