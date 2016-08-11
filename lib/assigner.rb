require "AssignmentResult.rb"

class Assigner
  def initialize(drivers, orders)
    @drivers = drivers
    @orders = orders
  end

  def Assign
    eligibleDrivers = @drivers.select  { |d| IsEligibleDriver(d) }

    if eligibleDrivers.size == 0
      return AssignmentResult.new([], @orders)
    end

    return AssignmentResult.new([], nil)
  end

  def IsEligibleDriver(driver)
    driver.orders == nil || (driver.orders.size < 3 && !driver.orders.any? { |order| order.size == "large" })
  end
end