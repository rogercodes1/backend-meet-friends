class PlacesController < ApplicationController

require 'rest-client'
require 'json'
require 'http'
API_HOST = "https://api.yelp.com"
SEARCH_PATH = "/v3/businesses/search"
BUSINESS_PATH = "/v3/businesses/"

DEFAULT_BUSINESS_ID = "yelp-san-francisco"
DEFAULT_TERM = "restaurants"
DEFAULT_LOCATION = "10004"
SEARCH_LIMIT = 20


  def index
      data = request.params
      url = "#{API_HOST}#{SEARCH_PATH}"
      params = {
      term: data["term"],
      location: data["location"],
      limit: data["limit"],
      radius: data["radius"]
      }
      response = HTTP.auth(yelp_secret).get(url, params: params)
      results = response.parse
      render json:{
      results: results,
        status: :accepted
      }
  end

  def create
    url = "#{API_HOST}#{SEARCH_PATH}"
    params = {
    term: params["searchTerm"],
    location: params["location"],
    limit: SEARCH_LIMIT
    }
    response = HTTP.auth(yelp_secret).get(url, params: params)
    results = response.parse
    render json:{
    results: results,
      status: :accepted
    }
  end

  def show
  end


end
