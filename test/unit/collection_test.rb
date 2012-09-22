require_relative '../test_helper'
require_relative '../../lib/collection'

describe Collection do
  it 'should have an empty things list on initialization' do
    Collection.new.things.must_equal []
  end
  it 'should allow things to be inserted' do
    thing = mock()
    collection = Collection.new
    collection.insert(thing)
    collection.things.first.must_equal thing
  end
  it 'should be able to select things out of the collection' do
    thing1 = mock()
    thing1.stubs(:foo).returns('s')
    thing2 = mock()
    thing2.stubs(:foo).returns('x')
    collection = Collection.new
    collection.insert(thing1)
    collection.insert(thing2)
    collection.select(:foo, 's').must_equal thing1
  end
end
