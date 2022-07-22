# frozen_string_literal: true

class Passes < Base
  private

  def update_quality(item)
    if item.sell_in > 10
      item.quality += 1
    elsif item.sell_in.between?(6, 10)
      item.quality += 2
    elsif item.sell_in.between?(1, 5)
      item.quality += 3
    else
      item.quality = 0
    end

    change_high_quality(item)
  end
end
