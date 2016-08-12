require "AssignmentResult.rb"

class GreedyAssigner

  def initialize(drivers, orders)
    @drivers = drivers
    @orders = orders
  end

  def Assign
    assignments = []
    remainingOrders = @orders

    @drivers.each do |driver|
      ordersForDriver = []
      currentOrderCount = 0
      if (driver.orders != nil)
        currentOrderCount = driver.orders.size
      end
      eligibleOrders = remainingOrders.select  { |order| IsEligibleOrder(driver, order) }

      while (currentOrderCount < 3 && eligibleOrders.size > 0)
        orderToAssign = eligibleOrders.shift()
        ordersForDriver.push(orderToAssign.id)
        remainingOrders.delete_if { |o| o.id == orderToAssign.id}
        currentOrderCount += 1

        # Q: Did they mean no other orders, or just no additional?
        if(orderToAssign.size == "large")
          break
        end
      end

      assignments.push(Assignment.new(driver.id, ordersForDriver))
    end

    AssignmentResult.new(assignments, remainingOrders)
  end

  def IsEligibleOrder(driver, order)
    DistanceBetweenTwoPoints(driver.location, order.origin) <= 5
  end

  # Probably should use Haversine formula in real world application
  # because the world isnt flat. Tradeoffs were made.
  def DistanceBetweenTwoPoints(a, b)
    Math.sqrt( ((a.x - b.x) ** 2) + ((a.y - b.y) ** 2) )
  end

end

class Assignment
  def initialize(driverId, orderIds)
    @driverId = driverId
    @orderIds = orderIds
  end
end
