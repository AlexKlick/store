class Market

  attr_reader :name, :vendors
  def initialize(name)
    @name = name
    @vendors =[]
  end

  def add_vendor(vendor)
    @vendors << vendor
  end

  def vendor_names
    @vendors.map{|vendor| vendor.name}
  end

  def vendors_that_sell(item)
    @vendors.find_all{|vendor| 
      vendor.inventory.find{|inventory| 
        inventory[0] == item
        }
      }
  end

  def sorted_item_list
    @vendors.flat_map{|vendor| 
      vendor.inventory.map{|item| 
        item[0]
        }
      }.uniq
  end

  def item_total_q(item)
    if item.class != String
      item = item.name
    end
    @vendors.flat_map{|vendor| 
      vendor.inventory.find_all{|inv| 
        inv[0].name == item}.map{|item_hash| 
          item_hash[1]
    }}.sum
  end

  def vendors_with_inventory(item)
    if item.class == String
      item = @vendors.map{|vendor| vendor.inventory.find{|inv| inv[0].name == item}}
    end
    @vendors.map{|vendor| 
      vendor.inventory.include?(item) ? 
      vendor 
      : nil
    }.compact
  end

  def total_inventory
    hash = Hash.new
    inside_hash = Hash.new
    sorted_item_list.map{|item_name| hash[item_name] = {quantity: item_total_q(item_name), vendors: vendors_with_inventory(item_name)}}
    hash
  end

  def overstocked_items
    total_inventory.find_all{|item| item[1][:quantity] > 50 || item[1][:vendors].length > 1}.map{|item| item[0]}
  end
end