require_relative "../../lib/assignment.rb"

class AssignmentController < ApplicationController
  def about
    render :text => "Hello. This is the about action for the assignment controller."
  end

  def assign
    assigner = Assigner.new('Drivers', 'Orders')
    render :text => assigner.Assign
  end
end
