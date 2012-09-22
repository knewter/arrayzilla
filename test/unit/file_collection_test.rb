require_relative '../test_helper'
require_relative '../../lib/file_collection'

describe FileCollection do
  before do
    @storage = mock('storage')
    @path = ''
    @dir = mock()
    @storage.expects(:new).with(@path).returns(@dir)
    @dir.stubs(:insert_thing)
    @collection = FileCollection.new(@storage, @path)
  end
  it 'should have an empty things list on initialization' do
    @dir.stubs(:things).returns([])
    @collection.things.must_equal []
  end
  it 'should allow things to be inserted' do
    thing = mock()
    @collection.insert(thing)
    @collection.things.first.must_equal thing
  end
  it 'should notify the storage of a thing insertion' do
    thing = mock()
    @storage.expects(:insert_thing).with(thing)
    @collection.insert(thing)
  end
  it 'should be able to select things out of the collection' do
    thing1 = mock()
    thing1.stubs(:foo).returns('s')
    thing2 = mock()
    thing2.stubs(:foo).returns('x')
    @collection.insert(thing1)
    @collection.insert(thing2)
    @storage.expects(:things).returns([thing1, thing2])
    @collection.select(:foo, 's').must_equal thing1
  end
end
