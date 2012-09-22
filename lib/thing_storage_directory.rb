class ThingStorageDirectory
  def initialize(path)
    @path = path
  end

  def get_files
    Dir["#{@path}/*.thing"]
  end

  def insert_thing(thing)
    file = File.open("#{@path}/#{thing.object_id}.thing", 'w')
    file << Marshal.dump(thing)
    file.close
  end

  def things
    files = get_files
    arr = []
    files.each do |file|
      arr << Marshal.load(File.read(file))
    end
    arr
  end
end
