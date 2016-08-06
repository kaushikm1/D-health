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
    @yearly2000s = yearly_plot(0,15)
    @yearly90s = yearly_plot(90,99)
    
    
  end
  
  def device
    
    @plotThree = my_helperThree
    @classTwoyearly90s = classtwo_yearly_plot(90,99)
    @classTwoyearly00s = classtwo_yearly_plot(0,15)
    
  end
  
  def resource
    
  end
  
  def contact
    
  end
  
end