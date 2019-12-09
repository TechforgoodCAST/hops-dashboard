# frozen_string_literal: true
class DesignHopsController < ApplicationController

  def show
    @hop = authorize DesignHop.find_by(id: params[:id])
  end
  
end
