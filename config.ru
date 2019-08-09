require "roda"
require_relative "system"
require_relative "interface_adapters"

class App < Roda
  plugin :render

  route do |r|
    r.root do
      @presenter = Presenter.new
      Controller.new.call(
        r.params,
        @presenter,
        success: -> { render "green_way" },
        failure: -> { render "red_way" }
      )
    end
  end
end

run App.freeze.app
