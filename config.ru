require "roda"
require_relative "interface_adapters.rb"

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
