# frozen_string_literal: true

class Base
  MAXIMUM_QUALITY = 50
  MINIMUM_QUALITY = 0

  def update(item)
    update_quality(item)
    update_sell_in(item)
  end

  private

  def update_quality(_item)
    raise 'Must Implement!'
  end

  def update_sell_in(item)
    item.sell_in -= (Item.type(item) == :sulfuras ? 0 : 1)
  end

  def abnormal_correction(item)
    return unless item.present?

    change_low_quality(item)
    change_high_quality(item)
  end

  def change_low_quality(item)
    item.quality = MINIMUM_QUALITY if item.quality < MINIMUM_QUALITY
  end

  def change_high_quality(item)
    item.quality = MAXIMUM_QUALITY if item.quality > MAXIMUM_QUALITY
  end
end
