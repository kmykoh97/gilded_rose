# frozen_string_literal: true

require 'item'

describe Item do
  it "shows the Item's details nicely" do
    item = Item.new('itemname', 1, 2)
    expect(item.to_s).to eq "itemname, 1, 2"
  end
end
