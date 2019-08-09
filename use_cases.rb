require_relative "entities"

class Interactor
  class Form
    def initialize(params)
      @params = params
    end

    def valid?
      [true, false].sample
    end
  end

  def initialize(params)
    @form = Form.new(params)
  end

  def call
    if @form.valid?
      Success.new
    else
      Failure.new
    end
  end
end
