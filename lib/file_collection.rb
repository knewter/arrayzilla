class FileCollection
  def initialize(storage_class, path)
    @storage = storage_class.new(path)
  end

  def things
    @storage.things
  end

  def insert thing
    @storage.insert_thing(thing)
  end

  def select attribute, value
    things.detect do |item|
      item.send(attribute) == value
    end
  end
end
