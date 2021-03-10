require 'minitest/autorun'
require 'minitest/pride'
require './lib/item'
require './lib/vendor'

class VendorTest < Minitest::Test
  def setup 
    @item1 = Item.new({name: 'Peach', price: "$0.75"})
    @item2 = Item.new({name: 'Tomato', price: '$0.50'})
    @vendor = Vendor.new("Rocky Mountain Fresh")
  end

  def test_attributes
    assert_equal @vendor.name, "Rocky Mountain Fresh"
    assert_equal @vendor.inventory, {}
  end

  def test_check_stock
    assert_equal @vendor.check_stock(@item1), 0
    @vendor.stock(@item1, 30)
    #require 'pry' ; binding.pry
    assert_equal @vendor.inventory, {@item1 => 30}
    assert_equal @vendor.check_stock(@item1), 30
    @vendor.stock(@item1, 25)
    assert_equal @vendor.check_stock(@item1), 55
    @vendor.stock(@item2, 12)
    assert_equal @vendor.inventory, {@item1 => 55, @item2 => 12}

  end
end
