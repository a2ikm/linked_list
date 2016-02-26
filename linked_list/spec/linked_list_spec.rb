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
end
