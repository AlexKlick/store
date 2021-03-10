class Vendor
  attr_reader :name, :inventory
  def initialize(name)
    @name = name
    @inventory = Hash.new(0)
  end
  def check_stock(item)
    quantity = @inventory.find{|stock_item| stock_item[0] == item}
    if quantity == nil
      0
    else 
      quantity[1]
    end
  end

  def stock(item, quantity)
    @inventory[item] = @inventory[item] + quantity
  end

  def potential_revenue
    total = 0
    @inventory.each{|inv| total = total + inv[0].price[1..-1].to_f * inv[1]}
    total
  end

  
end