# frozen_string_literal: true

class Item
  attr_accessor :name, :sell_in, :quality

  ITEM_TYPES = { brie: 'Aged Brie',
                 sulfuras: 'Sulfuras, Hand of Ragnaros',
                 passes: 'Backstage passes to a TAFKAL80ETC concert',
                 conjured: 'Conjured Mana Cake' }.freeze

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s
    "#{@name}, #{@sell_in}, #{@quality}"
  end

  def self.type(item)
    ITEM_TYPES.key(item.name) || :normal
  end
end
