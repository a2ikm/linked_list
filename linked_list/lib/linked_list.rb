require "linked_list/version"

class LinkedList
  class Element
    attr_reader :object
    attr_accessor :next_element

    def initialize(object, next_element)
      @object = object
      @next_element = next_element
    end
  end

  def initialize
    @first_element = nil
  end

  def first
    return nil if @first_element.nil?
    @first_element.object
  end

  def unshift(object)
    if @first_element.nil?
      @first_element = Element.new(object, nil)
    else
      old_first_element = @first_element
      @first_element = Element.new(object, old_first_element)
    end
    self
  end
end
