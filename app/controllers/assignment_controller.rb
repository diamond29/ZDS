require_relative "../../lib/assignment.rb"
require 'json'
require 'ostruct'
require 'stringio'

class AssignmentController < ApplicationController
  def about
    render :plain => "Hello. This is the about action for the assignment controller."
  end

  def assign
    postObj = JSON.parse(request.raw_post, object_class: OpenStruct)
    drivers = postObj.drivers
    orders = postObj.orders

# Temp test
    s = StringIO.new
    s << "Number of drivers: #{drivers.size}\n"
    s << "Number of orders: #{orders.size}\n"
    render :plain => s.string

#    assigner = Assigner.new('Drivers', 'Orders')
#    render :plain => assigner.Assign
  end
end
