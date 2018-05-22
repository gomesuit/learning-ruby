require 'pry'
require 'sinatra'
require 'csv'

get '/' do
  'Hello world!'
end

get '/csv' do
  content_type 'application/csv'
  attachment "myfilename.csv"
  _csv_string = CSV.generate do |csv|
    csv << ["row", "of", "CSV", "data"]
    csv << ["another", "row"]
  end
end

pp 'finish'
