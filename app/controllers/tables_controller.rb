require "csv"

class TablesController < ApplicationController
  def index
    # Get the data table
    file_path = Rails.root.join("db", "data", "Table_Input.csv")
    @table1 = CSV.read(file_path, headers: true)

    # Convert the data to Object
    tableData = @table1.each_with_object({}) do |row, map|
      map[row["Index #"]] = row["Value"].to_i
    end

    # Process data for Table 2
    @alpha = tableData["A5"] + tableData["A20"]
    @beta = tableData["A15"] / tableData["A7"]
    @charlie = tableData["A13"] * tableData["A12"]
  end
end
