class StaticPagesController < ApplicationController
  def home
    @towns = Town.all
    @properties = Property.take 6
  end

  def contacts
    @town = Town.first
    @properties = Property.take 6
  end

  def about
  end

  def privacy
  end
end

