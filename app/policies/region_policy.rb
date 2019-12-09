# frozen_string_literal: true

class RegionPolicy < ApplicationPolicy
  def show?
    user.is_admin?
  end
  
  def index?
    user.is_admin?
  end
end
