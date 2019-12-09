# frozen_string_literal: true
class NetworksController < ApplicationController

  def show
    @network = authorize Network.find_by(id: params[:id])
    @attendees = authorize Person.joins(:design_hop => :networks).where(networks: {id: params[:id]})
  end
  
  def index
    @networks = authorize Network.all.order(name: :asc)
  end
  
end
