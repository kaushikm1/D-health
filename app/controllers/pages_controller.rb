require 'open-uri'
require 'openssl'
require 'json'

class PagesController < ApplicationController
  
  def home
    
  end
  
  def about
    
  end
  
  def content
    
    OpenSSL::SSL.const_set(:VERIFY_PEER, OpenSSL::SSL::VERIFY_NONE)
    url = 'https://api.fda.gov/drug/event.json?api_key=hQ4jRHCt6WIYjcDYHBvIxIbMNPhlg5Hyw9WLhpLQ&search=_missing_:companynumb&limit=1'
    response = open(url).read
    @result = response.split("\n")
    
  end
  
end