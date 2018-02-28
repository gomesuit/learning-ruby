# Imports the Google Cloud client library
require "google/cloud/bigquery"

# Instantiates a client
bigquery = Google::Cloud::Bigquery.new(
  project: ENV['PROJECT_ID'],
  keyfile: './service-account-key.json'
)

# The name for the new dataset
dataset_name = "my_new_dataset"

# Creates the new dataset
dataset = bigquery.create_dataset dataset_name

puts "Dataset #{dataset.dataset_id} created."
