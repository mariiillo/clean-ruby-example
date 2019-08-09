require_relative "use_cases"

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

class Presenter
  def initialize(message)
    @message = message
  end

  def show_message
    @message
  end
end
