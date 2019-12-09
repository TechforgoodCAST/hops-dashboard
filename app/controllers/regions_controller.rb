# frozen_string_literal: true
class RegionsController < ApplicationController

  def show
    @region = authorize Region.find_by(id: params[:id])
  end
  
  def index
    @hops = authorize DesignHop.joins(:region).merge(Region.order(name: :asc)).order(date: :desc, name: :asc)
  end
  
end
