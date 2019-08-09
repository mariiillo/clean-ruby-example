require "roda"

# Framework
class App < Roda
  route do |r|
    r.root do
      Controller.new.call(
        r.params,
        success: -> { r.redirect "green_way" },
        failure: -> { r.redirect "red_way" }
      )
    end

    r.get "green_way" do
      "YOU DID IT!"
    end

    r.get "red_way" do
      "GO HOME, YOU ARE DRUNK!"
    end
  end
end

run App.freeze.app

# Interface adapters
class Controller
  def call(params, callbacks)
    @interactor = Interactor.new(params).call
    if @interactor.success?
      callbacks[:success].call
    else
      callbacks[:failure].call
    end
  end
end

class Presenter; end

# Use cases
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

# Entities (value objects)
class Success
  def success?
    true
  end
end

class Failure
  def success?
    false
  end
end
