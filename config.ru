require "roda"

class App < Roda
  route do |r|
    r.root do
      @form = FormObject.new
      if @form.valid?
        Interactor.new
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

class FormObject
  def valid?
    [true, false].sample
  end
end

class Interactor; end
