require 'google/cloud/bigquery'
require 'pry'

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
  pp job.data.first
  #=> {:title=>[{:value=>'hamlet', :count=>5318}, ...}
end
