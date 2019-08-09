require "securerandom"
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

  def initialize(params, repository, presenter)
    @form = Form.new(params)
    @repository = repository
    @presenter = presenter
  end

  def call
    if @form.valid?
      @repository.set(:age, (1..20).to_a.sample)
      @presenter.set_age(@repository[:age])
      Success.new
    else
      Failure.new
    end
  end
end
