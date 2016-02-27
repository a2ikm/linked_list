require 'spec_helper'

describe LinkedList do
  describe "#empty?" do
    before do
      @linked_list = LinkedList.new
    end
    it "returns true if empty" do
      expect(@linked_list.empty?).to eq true
    end
    it "returns false if having any objects" do
      @linked_list.unshift(Object.new)
      expect(@linked_list.empty?).to eq false
    end
  end
  describe "#first" do
    before do
      @linked_list = LinkedList.new
    end
    context "empty" do
      it "returns nil" do
        expect(@linked_list.first).to be_nil
      end
    end
  end
  describe "#last" do
    before do
      @linked_list = LinkedList.new
    end
    context "empty" do
      it "returns nil" do
        expect(@linked_list.last).to be_nil
      end
    end
  end
  describe "#unshift" do
    before do
      @linked_list = LinkedList.new
    end
    context "empty" do
      it "set first object" do
        object = Object.new
        @linked_list.unshift(object)
        expect(@linked_list.first).to eq object
      end
      it "returns self" do
        object = Object.new
        expect(@linked_list.unshift(object)).to eq @linked_list
      end
    end
    context "has objects" do
      before do
        @initial_object = Object.new
        @linked_list.unshift(@initial_object)
      end
      it "set first object" do
        object = Object.new
        @linked_list.unshift(object)
        expect(@linked_list.first).to eq object
      end
      it "returns self" do
        object = Object.new
        expect(@linked_list.unshift(object)).to eq @linked_list
      end
    end
  end
  describe "#push" do
    before do
      @linked_list = LinkedList.new
    end
    context "empty" do
      it "set first object" do
        object = Object.new
        @linked_list.push(object)
        expect(@linked_list.first).to eq object
      end
      it "returns self" do
        object = Object.new
        expect(@linked_list.push(object)).to eq @linked_list
      end
    end
    context "has objects" do
      before do
        @initial_object = Object.new
        @linked_list.push(@initial_object)
      end
      it "set last object" do
        object = Object.new
        @linked_list.push(object)
        expect(@linked_list.last).to eq object
      end
      it "returns self" do
        object = Object.new
        expect(@linked_list.push(object)).to eq @linked_list
      end
    end
  end
  describe "#delete" do
    before do
      @linked_list = LinkedList.new
    end
    context "empty" do
      it "returns nil" do
        expect(@linked_list.delete(Object.new)).to be_nil
      end
    end
    context "has one object which is passed" do
      before do
        @object = Object.new
        @linked_list.push(@object)
      end
      it "makes self empty" do
        @linked_list.delete(@object)
        expect(@linked_list).to be_empty
      end
      it "returns deleted object" do
        expect(@linked_list.delete(@object)).to eq @object
      end
    end
    context "has one object which is different from passed object" do
      before do
        @object = Object.new
        @linked_list.push(@object)
      end
      it "keeps stored object" do
        @linked_list.delete(Object.new)
        expect(@linked_list.first).to eq @object
      end
      it "returns nil" do
        expect(@linked_list.delete(Object.new)).to be_nil
      end
    end
    context "has three object and one of them is the passed object" do
      before do
        @object1 = Object.new
        @linked_list.push(@object1)
        @object2 = Object.new
        @linked_list.push(@object2)
        @object3 = Object.new
        @linked_list.push(@object3)
      end
      it "deletes passed object" do
        @linked_list.delete(@object2)
        expect(@linked_list.first).to eq @object1
        expect(@linked_list.last).to eq @object3
      end
      it "returns deleted object" do
        expect(@linked_list.delete(@object2)).to eq @object2
      end
    end
    context "has two same objects which is passed" do
      before do
        @object1 = Object.new
        @object2 = Object.new
        @linked_list.push(@object1)
        @linked_list.push(@object2)
        @linked_list.push(@object1)
      end
      it "delete most front" do
        @linked_list.delete(@object1)
        expect(@linked_list.first).to eq @object2
        expect(@linked_list.last).to eq @object1
      end
      it "returns deleted object" do
        expect(@linked_list.delete(@object1)).to eq @object1
      end
    end
  end
  describe "#each" do
    before do
      @linked_list = LinkedList.new
      @object1 = Object.new
      @linked_list.push(@object1)
      @object2 = Object.new
      @linked_list.push(@object2)
    end
    it "runs the block on each object" do
      array = []
      @linked_list.each do |object|
        array << object
      end
      expect(array).to eq [@object1, @object2]
    end
    it "returns self" do
      expect(@linked_list.each { |obj| }).to eq @linked_list
    end
  end
end
