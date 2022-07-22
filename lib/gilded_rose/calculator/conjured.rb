# frozen_string_literal: true

class Conjured < Base
  private

  def update_quality(item)
    item.quality -= (item.sell_in >= 0 ? 2 : 4)
    change_low_quality(item)
  end
end
