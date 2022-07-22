# frozen_string_literal: true

class Normal < Base
  private

  def update_quality(item)
    item.quality -= (item.sell_in >= 0 ? 1 : 2)
    change_low_quality(item)
  end
end
