require "dry-container"
require_relative "interface_adapters"

class Container
  extend Dry::Container::Mixin
end

Container.register(:repository, MemoryRepository.new)
