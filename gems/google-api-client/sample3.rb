require 'google/apis/analyticsreporting_v4'
require 'pry'

view_id = ENV['GA_VIEW_ID']
scope = ['https://www.googleapis.com/auth/analytics.readonly']
analytics =Google::Apis::AnalyticsreportingV4

client = analytics::AnalyticsReportingService.new
client.authorization = Google::Auth::ServiceAccountCredentials.make_creds(
  json_key_io: File.open('service-account-key.json'),
  scope: scope
)

date_range = analytics::DateRange.new(start_date: '7DaysAgo', end_date: 'today')
metric = analytics::Metric.new(expression: 'ga:users')
dimension = analytics::Dimension.new(name: 'ga:browser')
request = analytics::GetReportsRequest.new(
  report_requests: [analytics::ReportRequest.new(
    view_id: view_id, metrics: [metric], dimensions: [dimension], date_ranges: [date_range]
  )]
)
response = client.batch_get_reports(request)

pp response.reports[0].column_header.dimensions
pp response.reports[0].column_header.metric_header.to_h

response.reports[0].data.rows.each do |row|
  pp row.to_h
end
