require 'spec_helper'

describe HashTable do
  before do
    @hash_table = HashTable.new
  end
  describe "#set and #get" do
    context "empty" do
      it "sets value for key" do
        @hash_table.set("key", "value")
        expect(@hash_table.get("key")).to eq "value"
      end
    end
    context "with other key" do
      before do
        @hash_table.set("key1", "value1")
      end
      it "sets value for key" do
        @hash_table.set("key2", "value2")
        expect(@hash_table.get("key1")).to eq "value1"
        expect(@hash_table.get("key2")).to eq "value2"
      end
    end
    context "with duplicated key" do
      before do
        @hash_table.set("key", "value1")
      end
      it "overrides for the key" do
        @hash_table.set("key", "value2")
        expect(@hash_table.get("key")).to eq "value2"
      end
    end
  end
  describe "#each" do
    context "empty" do
      it "do nothins" do
        array = []
        @hash_table.each { |k, v| array << [k, v] }
        expect(array).to be_empty
      end
      it "returns self" do
        expect(@hash_table.each { |k, v| }).to eq @hash_table
      end
    end
    context "with keys and values" do
      before do
        @hash_table.set("key1", "value1")
        @hash_table.set("key2", "value2")
      end
      it "runs block on each key-value pair" do
        array = []
        @hash_table.each { |k, v| array << [k, v] }
        expect(array.size).to eq 2
        expect(array).to eq [["key1", "value1"], ["key2", "value2"]]
      end
      it "returns self" do
        expect(@hash_table.each { |k, v| }).to eq @hash_table
      end
    end
  end
end
