class Collection
  attr_reader :things

  def initialize
    @things = []
  end

  def insert thing
    @things << thing
  end

  def select attribute, value
    @things.detect do |item|
      item.send(attribute) == value
    end
  end
end
