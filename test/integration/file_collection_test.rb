require_relative '../test_helper'
require_relative '../../lib/file_collection'
require_relative '../../lib/thing_storage_directory'
require 'ostruct'

heath = OpenStruct.new({ name: 'heath' })
josh  = OpenStruct.new({ name: 'josh'  })

path = '/home/jadams/tmp/things'

Dir["#{path}/*.thing"].each{|f| FileUtils.rm(f) }

describe 'integrating FileCollection' do
  it 'works' do
    collection = FileCollection.new(ThingStorageDirectory, path)
    collection.insert(heath)
    collection.insert(josh)

    collection.select(:name, 'josh').must_equal josh
  end
end
