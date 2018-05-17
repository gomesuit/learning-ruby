require 'google/cloud/bigquery'
require 'pry'
require 'csv'

bigquery = Google::Cloud::Bigquery.new(
  project: ENV['PROJECT_ID'],
  keyfile: './service-account-key.json'
)

sql = <<-SQL
SELECT
  APPROX_TOP_COUNT(corpus, 10) as title,
  COUNT(*) as unique_words
FROM
  `bigquery-public-data.samples.shakespeare`
SQL

job = bigquery.query_job sql

job.wait_until_done!

if !job.failed?
  csv_string = CSV.generate do |csv|
    job.data.first[:title].each do |row|
      csv << [row[:value], row[:count]]
    end
  end
  puts csv_string.to_s
end
