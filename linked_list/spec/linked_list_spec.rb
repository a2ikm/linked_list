require 'spec_helper'

describe LinkedList do
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
end
