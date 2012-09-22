class LazyArray
  def initialize array_maker
    @array_maker = array_maker
  end

  def array
    @array ||= @array_maker.call
  end

  def <<(item)
    array << item
  end

  def [](index)
    array[index]
  end
end
