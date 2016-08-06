class Assigner
  def initialize(drivers, orders)
    @drivers = drivers
    @orders = orders
  end

  def Assign
    @drivers + " " + @orders
  end
end
