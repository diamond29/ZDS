require_relative "../../lib/assigner.rb"
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

    assigner = Assigner.new(drivers, orders)
    result = assigner.Assign

    s = StringIO.new
    s << result.to_json
    render :plain => s.string


#    render :plain => assigner.Assign
  end
end
