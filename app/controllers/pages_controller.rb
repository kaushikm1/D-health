require 'open-uri'
require 'openssl'
require 'json'

class PagesController < ApplicationController
include Plots
  
  def home
    
  end
  
  def about
    
  end
      
  def content
    @plotOne = my_helperOne
    
    
    
    
  end
  
  def time
    
    @plotTwo = my_helperTwo
    @yearly = yearly_plot
    
    
  end
  
  def device
    
    @plotThree = my_helperThree
    @classTwoyearly = classtwo_yearly_plot
    
  end
  
  def resource
    
  end
  
  def contact
    
  end
  
end