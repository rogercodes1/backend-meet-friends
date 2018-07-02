class Api::V1::PlacesController < ApplicationController
require 'rest-client'
require 'json'
require 'pry'

  def index

  end

  def create
  end

  def show
  end

  def url()
    yelpSearch = RestClient.get("https://api.yelp.com/v3/businesses/search?term=cookies&location=10004")
    yelpData = JSON.parse(yelpSearch)
  end


end
