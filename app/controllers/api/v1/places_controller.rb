class Api::V1::PlacesController < ApplicationController
require 'rest-client'
require 'json'
require 'http'
API_HOST = "https://api.yelp.com"
SEARCH_PATH = "/v3/businesses/search"
BUSINESS_PATH = "/v3/businesses/"

DEFAULT_BUSINESS_ID = "yelp-san-francisco"
DEFAULT_TERM = "bar"
DEFAULT_LOCATION = "10004"
SEARCH_LIMIT = 20


  def index

  end

  def create
  end

  def show
  end

  def yelp(term = DEFAULT_TERM, location = DEFAULT_LOCATION)
    url = "#{API_HOST}#{SEARCH_PATH}"
    params = {
    term: term,
    location: location,
    limit: SEARCH_LIMIT
    }
    # byebug
    response = HTTP.auth(ENV['YELP_API_KEY']).get(url, params: params)
    results = response.parse
    # byebug
    render json:{
    results: results,
      status: :accepted
    }

  end


end
