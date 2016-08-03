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
    #@plotTwo = my_helperTwo
    #@plotThree = my_helperThree
    @test = my_helperFour
    #@yearly = yearly_plot
    #@classTwoyearly = classtwo_yearly_plot
    
    
    
  end
  
  def resource
    
  end
  
  def contact
    
  end
  
end