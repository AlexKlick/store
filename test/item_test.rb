require 'minitest/autorun'
require 'minitest/pride'
require './lib/item'
require 'pry'


class ItemTest < Minitest::Test
  def setup 
    @item1 = Item.new({name: 'Peach', price: "$0.75"})
    @item2 = Item.new({name: 'Tomato', price: '$0.50'})

  end
  def test_attributes
    assert_equal @item2.name, 'Tomato'
    assert_equal @item2.price, 0.5
  end
end
