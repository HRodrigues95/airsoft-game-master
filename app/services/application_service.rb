class ApplicationService
  class ServiceFailed < StandardError; end

  attr_reader :errors

  def self.call(*args, &block)
    service = new(*args, &block)
    raise NotImplementedError, '.call must be defined in subclass' unless service.class.method_defined?(:call)

    service.call
  ensure
    Rails.logger.error("[#{name}]: #{error_msg}") if @errors&.any?
  end

  def self.call!(*args, &block)
    service = new(*args, &block)
    raise NotImplementedError, '.call! must be defined in subclass' unless service.class.method_defined?(:call!)

    service.call!
  end

  def initialize(*)
    @errors = []
  end

  def success?
    @errors.empty?
  end

  def error_msg
    @errors.join(', ')
  end
end