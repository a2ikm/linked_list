require "hash_table/version"
require "linked_list"

class HashTable
  BIN_SIZE = 4

  def initialize
    @bins = Array.new(BIN_SIZE) do
      LinkedList.new
    end
  end

  def set(key, value)
    index = key.hash % BIN_SIZE
    bin = @bins[index]

    bin.each do |pair|
      if pair[0] == key
        pair[1] = value
        return self
      end
    end

    bin.unshift([key, value])
    self
  end

  def get(key)
    index = key.hash % BIN_SIZE
    bin = @bins[index]

    bin.each do |pair|
      if pair[0] == key
        return pair[1]
      end
    end

    nil
  end

  def each
    @bins.each do |bin|
      bin.each do |pair|
        yield pair[0], pair[1]
      end
    end
    self
  end
end
