# Imports the Google Cloud client library
require "google/cloud/bigquery"

# Instantiates a client
bigquery = Google::Cloud::Bigquery.new(
  project: ENV['PROJECT_ID'],
  keyfile: './service-account-key.json'
)

dataset = bigquery.create_dataset "my_dataset"

table = dataset.create_table "people" do |schema|
  schema.string "first_name", mode: :required
  schema.record "cities_lived", mode: :repeated do |nested_schema|
    nested_schema.string "place", mode: :required
    nested_schema.integer "number_of_years", mode: :required
  end
end
