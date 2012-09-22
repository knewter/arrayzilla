require_relative '../test_helper'
require_relative '../../lib/thing_storage_directory'
require 'fileutils'

describe ThingStorageDirectory do
  before do
    @path = "./test/tmp/things"
    # Clean up the directory
    Dir["#{@path}/*"].map{|f| FileUtils.rm(f) }
    @dir = ThingStorageDirectory.new('./test/tmp/things')
  end
  it 'is initialized with a path' do
    @dir.things.must_equal []
  end

  it 'knows how to insert a thing' do
    thing = 1
    file_mock = mock()
    File.expects(:open).with("#{@path}/#{thing.object_id}.thing", 'w').returns(file_mock)
    file_mock.expects(:<<).with(Marshal.dump(thing))
    file_mock.expects(:close)
    @dir.insert_thing(thing)
  end

  it 'knows how to get a thing' do
    thing = 'heath'
    @dir.insert_thing(thing)
    @dir.things.first.must_equal 'heath'
  end
end
