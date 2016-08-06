require 'open-uri'
require 'openssl'
require 'json'

module Plots
  def findingTotal(url)
    response = open(url).read
    result = JSON.parse(response)
    var_result = result['meta']
    return var_result['results']['total']
      
  end
  
  def my_helperOne
    my_dict = Hash.new
    OpenSSL::SSL.const_set(:VERIFY_PEER, OpenSSL::SSL::VERIFY_NONE)
    #url = 'https://api.fda.gov/device/510k.json?api_key=hQ4jRHCt6WIYjcDYHBvIxIbMNPhlg5Hyw9WLhpLQ&count=state'
    url = 'https://api.fda.gov/device/510k.json?count=state&search=medical_specialty_description:"Ophthalmic"+AND+date_received:[1990-01-01+TO+2016-01-01]'
    response = open(url).read
    result = JSON.parse(response)
    var_result = result['results']
    var_result.each do |res|
      if res['count'] > 5
        my_dict[res['term'].upcase] = res['count']
      end
    end
    return my_dict
  end
  
  def my_helperTwo
    my_dict = {'1990-1999' => 0, '2000-2015' => 0}
    OpenSSL::SSL.const_set(:VERIFY_PEER, OpenSSL::SSL::VERIFY_NONE)
    year_list = ['[1990-01-01+TO+2000-01-01]','[2000-01-01+TO+2016-01-01]']
    for index in 0..1
      url = 'https://api.fda.gov/device/510k.json?limit=100&search=medical_specialty_description:"Ophthalmic"+AND+date_received:' + year_list[index] 
      total = findingTotal(url)
      if index == 0
        my_dict['1990-1999'] = total
      else
        my_dict['2000-2015'] = total
      end
    end
    return my_dict
  end
  
  def yearly_plot(x,y)
    my_dict = Hash.new
    for index in x..y
      if index < 10
        url = 'https://api.fda.gov/device/510k.json?limit=100&search=medical_specialty_description:"Ophthalmic"+AND+date_received:
        [200' + index.to_s + '-01-01+TO+200' + index.to_s + '-12-31]'
        total = findingTotal(url)
        year = '200' + index.to_s
        my_dict[year] = total
      elsif index > 89
        url = 'https://api.fda.gov/device/510k.json?limit=100&search=medical_specialty_description:"Ophthalmic"+AND+date_received:
        [19' + index.to_s + '-01-01+TO+19' + index.to_s + '-12-31]'
        total = findingTotal(url)
        year = '19' + index.to_s
        my_dict[year] = total
      else
        url = 'https://api.fda.gov/device/510k.json?limit=100&search=medical_specialty_description:"Ophthalmic"+AND+date_received:
        [20' + index.to_s + '-01-01+TO+20' + index.to_s + '-12-31]'
        total = findingTotal(url)
        year = '20' + index.to_s
        my_dict[year] = total
      end
    end
    return my_dict
    
  end
  
  def my_helperThree
    my_dict = {"1" => 0, "2" => 0, "3" => 0}
    OpenSSL::SSL.const_set(:VERIFY_PEER, OpenSSL::SSL::VERIFY_NONE)
    for value in 1..3
      #url = 'https://api.fda.gov/device/510k.json?api_key=hQ4jRHCt6WIYjcDYHBvIxIbMNPhlg5Hyw9WLhpLQlimit=100&search=date_received:[1990-01-01+TO+2010-01-01]+AND+device_class:' + value.to_s
      url = 'https://api.fda.gov/device/510k.json?limit=100&search=medical_specialty_description:"Ophthalmic"+AND+date_received:[1990-01-01+TO+2010-01-01]+AND+device_class:' + value.to_s
      if value == 1
        my_dict['1'] = findingTotal(url)
      elsif value == 2
        my_dict['2'] = findingTotal(url)
      else
        my_dict['3'] = findingTotal(url)
      end
    end
    return my_dict
  end
  
  
  
  def classtwo_yearly_plot(x,y)
    my_dict = Hash.new
    for index in x..y
      if index < 10
        url = 'https://api.fda.gov/device/510k.json?limit=100&search=medical_specialty_description:"Ophthalmic"+AND+date_received:
        [200' + index.to_s + '-01-01+TO+200' + index.to_s + '-12-31]+AND+device_class:2'
        total = findingTotal(url)
        year = '200' + index.to_s
        my_dict[year] = total
      elsif index > 89
        url = 'https://api.fda.gov/device/510k.json?limit=100&search=medical_specialty_description:"Ophthalmic"+AND+date_received:
        [19' + index.to_s + '-01-01+TO+19' + index.to_s + '-12-31]+AND+device_class:2'
        total = findingTotal(url)
        year = '19' + index.to_s
        my_dict[year] = total
      else
        url = 'https://api.fda.gov/device/510k.json?limit=100&search=medical_specialty_description:"Ophthalmic"+AND+date_received:
        [20' + index.to_s + '-01-01+TO+20' + index.to_s + '-12-31]+AND+device_class:2'
        total = findingTotal(url)
        year = '20' + index.to_s
        my_dict[year] = total
      end
    end
    return my_dict
  end
  

  def my_helperFour
    OpenSSL::SSL.const_set(:VERIFY_PEER, OpenSSL::SSL::VERIFY_NONE)
    @result = []
    #@states_list = []
    #@plotOne.each do |key,value|
      #@states_list.push(key)
    @states_list = ["ca"]
    states_yearly_plot
      
  end
    
  def stateCount(state)
    states_list.each do |state|
      my_dict = Hash.new
      year_list = [['[1980-01-01+TO+1989-01-01]','80s'],['[1990-01-01+TO+2000-01-01]','90s'],['[2000-01-01+TO+2010-01-01]','00s']]
      for index in 0..2
        url = 'https://api.fda.gov/device/510k.json?limit=100&search=medical_specialty_description:"Ophthalmic"+AND+state:' + state + '+AND+date_received:' + year_list[index][0]
        total = findingTotal(url)
        my_dict[year_list[index][1]] = total
      end
      @result.push([state,my_dict])
    end
  end
  
  def states_yearly_plot
    OpenSSL::SSL.const_set(:VERIFY_PEER, OpenSSL::SSL::VERIFY_NONE)
    @states_list.each do |state|
      my_dict = Hash.new
      for index in 0..1
        if index < 10
          url = 'https://api.fda.gov/device/510k.json?limit=100&search=medical_specialty_description:"Ophthalmic"+AND+state:' + state + 'date_received:
          [200' + index.to_s + '-01-01+TO+200' + index.to_s + '-12-31]'
          total = findingTotal(url)
          year = '200' + index.to_s
          my_dict[year] = total
        else
          url = 'https://api.fda.gov/device/510k.json?limit=100&search=medical_specialty_description:"Ophthalmic"+AND+state:' + state + 'date_received:
          [20' + index.to_s + '-01-01+TO+20' + index.to_s + '-12-31]'
          total = findingTotal(url)
          year = '20' + index.to_s
          my_dict[year] = total
        end
      end
      @result.push([state,my_dict])
    end
  end
    
    
  
  
  
end