require 'test_helper'

class Person
  include ActiveModel::Model
  include ActiveModel::Validations::Callbacks
  include WhinyValidation
  attr_accessor :name

  validates :name, presence: true
end

class WhinyValidationTest < ActiveSupport::TestCase
  setup do
    @io = StringIO.new
    ActiveSupport::LogSubscriber.logger = Logger.new @io
  end

  test "logging via Notifications" do
    ActiveSupport::Notifications.subscribe do |*args|
      payload = args.last
      assert_equal payload[:error_messages], payload[:object].errors.full_messages
    end

    person.valid?
  end

  test "logging via LogSubscriber" do
    person.valid?
    assert @io.string.include? "Name can't be blank"
  end

  def person
    Person.new
  end
end
