require 'open-uri'
require 'openssl'
require 'json'

class PagesController < ApplicationController
  
  def home
    
  end
  
  def about
    
  end
      
  
  
  
  def content
    @my_dict = Hash.new
    OpenSSL::SSL.const_set(:VERIFY_PEER, OpenSSL::SSL::VERIFY_NONE)
    url = 'https://api.fda.gov/drug/event.json?api_key=hQ4jRHCt6WIYjcDYHBvIxIbMNPhlg5Hyw9WLhpLQ&count=receiptdate'
    response = open(url).read
    result = JSON.parse(response)
    @var_result = result['results']
    @var_result.each do |res|
      @my_dict[res['time']] = res['count']
    end
  end
  
  def resource
    
  end
  
  def contact
    
  end
  
end