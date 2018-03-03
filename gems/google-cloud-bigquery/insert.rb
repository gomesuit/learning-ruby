require "google/cloud/bigquery"

bigquery = Google::Cloud::Bigquery.new(
  project: ENV['PROJECT_ID'],
  keyfile: './service-account-key.json'
)

dataset = bigquery.dataset "my_dataset"
table = dataset.table "people"

rows = [
    {
        "first_name" => "Anna",
        "cities_lived" => [
            {
                "place" => "Stockholm",
                "number_of_years" => 2
            }
        ]
    },
    {
        "first_name" => "Bob",
        "cities_lived" => [
            {
                "place" => "Seattle",
                "number_of_years" => 5
            },
            {
                "place" => "Austin",
                "number_of_years" => 6
            }
        ]
    }
]
table.insert rows
