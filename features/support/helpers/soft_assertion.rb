class SoftAssertion
  include RSpec::Matchers
  attr_accessor :status ,:messages

  def initialize
    @messages = []
    @status = :passed
  end

  def add_exception(message)
    @messages << message
    @status = :failed
  end

  def equals(actual, expected, message = nil)
    begin
      expect(actual).to eq expected
    rescue Exception => e
      @messages << "#{message} #{e}"
      @status = :failed
    end
  end


end
