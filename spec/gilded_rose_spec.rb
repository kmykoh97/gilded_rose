# frozen_string_literal: true

require 'gilded_rose/adapter'

describe GildedRose do
  describe '#call' do
    describe 'normal' do
      before do
        @normal = Item.new('normal item', 15, 20)
        @shop = GildedRose.new([@normal])
      end

      it 'reduces sell_in by 1' do
        expect { @shop.call }.to change { @normal.sell_in }.by(-1)
      end

      it 'reduces quality by 1' do
        expect { @shop.call }.to change { @normal.quality }.by(-1)
      end
    end

    describe 'brie' do
      before do
        @brie = Item.new('Aged Brie', 15, 20)
        @shop = GildedRose.new([@brie])
      end

      it 'reduces sell_in by 1' do
        expect { @shop.call }.to change { @brie.sell_in }.by(-1)
      end

      it 'increases quality by 1' do
        expect { @shop.call }.to change { @brie.quality }.by 1
      end
    end

    describe 'sulfuras' do
      before do
        @sulfuras = Item.new('Sulfuras, Hand of Ragnaros', 15, 80)
        @shop = GildedRose.new([@sulfuras])
      end

      it 'constant sell_in' do
        expect { @shop.call }.not_to change { @sulfuras.sell_in }
      end

      it 'constant quality' do
        expect { @shop.call }.not_to change { @sulfuras.quality }
        expect(@sulfuras.quality).to eq 80
      end
    end

    describe 'passes' do
      before do
        @pass = Item.new('Backstage passes to a TAFKAL80ETC concert', 15, 20)
        @shop = GildedRose.new([@pass])
      end

      it 'reduces sell_in by 1' do
        expect { @shop.call }.to change { @pass.sell_in }.by(-1)
      end

      it 'increases quality dynamically' do
        expect { @shop.call }.to change { @pass.quality }.by 1
      end

      it 'increases quality by 2' do
        pass = Item.new('Backstage passes to a TAFKAL80ETC concert', 10, 20)
        shop = GildedRose.new([pass])
        expect { shop.call }.to change { pass.quality }.by 2
      end

      it 'increases quality by 3' do
        pass = Item.new('Backstage passes to a TAFKAL80ETC concert', 1, 20)
        shop = GildedRose.new([pass])
        expect { shop.call }.to change { pass.quality }.by 3
      end
    end

    describe 'conjured' do
      before do
        @conjured = Item.new('Conjured Mana Cake', 15, 20)
        @shop = GildedRose.new([@conjured])
      end

      it 'reduces sell_in by 1' do
        expect { @shop.call }.to change { @conjured.sell_in }.by(-1)
      end

      it 'reduces quality by 1' do
        expect { @shop.call }.to change { @conjured.quality }.by(-2)
      end
    end
  end
end
