require_relative "../../lib/assigner.rb"
require 'json'
require 'ostruct'

class AssignmentController < ApplicationController
  def about
    render :plain => "Hello. This is the about action for the assignment controller."
  end

  def assign
    postObj = JSON.parse(request.raw_post, object_class: OpenStruct)
    drivers = postObj.drivers
    orders = postObj.orders

    assigner = Assigner.new(drivers, orders)
    result = assigner.Assign

    render :json => result
  end
end
