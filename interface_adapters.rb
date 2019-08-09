require_relative "use_cases"

class Controller
  def call(params, presenter, callbacks)
    @repository = MemoryRepository.new
    @interactor = Interactor.new(params, @repository, presenter).call
    if @interactor.success?
      callbacks[:success].call
    else
      callbacks[:failure].call
    end
  end
end

class Presenter
  def set_age(age)
    @age = age
  end

  def show_message
    "I'm #{@age} years old"
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
