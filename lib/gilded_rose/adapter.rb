# frozen_string_literal: true
# entrypoint to our application

require_relative './calculator/base'
require_relative './calculator/normal'
require_relative './calculator/brie'
require_relative './calculator/passes'
require_relative './calculator/conjured'

class GildedRose
  def initialize(items)
    @items = items
  end

  def call
    @items.each do |item|
      adapt(item)
    end
  end

  private

  def adapt(item)
    case Item.type(item)
    when :normal
      Normal.new.update(item)
    when :brie
      Brie.new.update(item)
    when :passes
      Passes.new.update(item)
    when :conjured
      Conjured.new.update(item)
    end
    # just pass for :sulfuras as no change needed
  end
end
