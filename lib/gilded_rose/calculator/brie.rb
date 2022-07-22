# frozen_string_literal: true

class Brie < Base
  private

  def update_quality(item)
    return if item.quality == MAXIMUM_QUALITY

    item.quality += 1
  end
end
