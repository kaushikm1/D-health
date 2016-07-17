class TableController < ApplicationController
  
  def new(table_params)
    @table = Table.new(table_params)
  end
  
  private
  def table_params
    params.required(:table).permit(:time, :count)
  end
end