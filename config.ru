require "roda"

class App < Roda
  route do |r|
    r.root do
      @interactor = Interactor.new(r.params, Presenter.new).call
      if @interactor.success?
        r.redirect "green_way"
      else
        r.redirect "red_way"
      end
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

class Presenter; end

class Interactor
  class Form
    def initialize(params)
      @params = params
    end

    def valid?
      [true, false].sample
    end
  end

  def initialize(params, presenter)
    @form = Form.new(params)
    @presenter = presenter
  end

  def call
    if @form.valid?
      sleep 0.1
      Success.new
      self
    else
      Failure.new
      self
    end
  end
end

class Success
  def success?
    true
    self
  end
end

class Failure
  def success?
    false
    self
  end
end
