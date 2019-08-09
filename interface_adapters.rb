require_relative "use_cases"

class Controller
  def call(params, callbacks)
    repository = MemoryRepository.new
    @interactor = Interactor.new(params, repository).call
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

class MemoryRepository
  def initialize
    @map ||= {}
  end

  def set(key, value)
    @map[key] = value
  end

  def get(key)
    @map[key]
  end
end
