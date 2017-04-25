require "rails_helper"

describe MenuHelper do
  describe "#menu_class" do
    it "return correct class" do
      expect(helper.menu_class("/path", "/path")).to eq "list-group-item active"
      expect(helper.menu_class("/path", "/other_path")).to eq "list-group-item"
    end
  end
end
