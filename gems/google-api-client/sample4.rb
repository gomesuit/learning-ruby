require 'google/apis/drive_v3'
require 'google/api_client/client_secrets'
require 'google/api_client/auth/installed_app'
require 'launchy'
require 'google/api_client/auth/storage'
require 'google/api_client/auth/storages/file_store'
require 'pry'
require 'csv'

CREDENTIAL_STORE_FILE = "#{$PROGRAM_NAME}-oauth2.json".freeze

Drive = Google::Apis::DriveV3
drive = Drive::DriveService.new

Google::Apis::RequestOptions.default.retries = 1000
storage = Google::APIClient::Storage.new(
  Google::APIClient::FileStore.new(CREDENTIAL_STORE_FILE)
)
drive.authorization = storage.authorize
if storage.authorization.nil?
  client_secrets = Google::APIClient::ClientSecrets.load
  flow = Google::APIClient::InstalledAppFlow.new(
    client_id: client_secrets.client_id,
    client_secret: client_secrets.client_secret,
    scope: ['https://www.googleapis.com/auth/drive.readonly']
  )
  drive.authorization = flow.authorize(storage)
end

def get_folders(drive, folder_id)
  items = drive.fetch_all(items: :files) do |token|
    drive.list_files(
      q: "'#{folder_id}' in parents and mimeType='application/vnd.google-apps.folder'",
      order_by: 'name',
      page_token: token
    )
  end
end

def get_files(drive, folder_id)
  items = drive.fetch_all(items: :files) do |token|
    drive.list_files(
      q: "'#{folder_id}' in parents and mimeType!='application/vnd.google-apps.folder'",
      fields: 'nextPageToken, files(id, name, owners, permissions, created_time, modified_time)',
      order_by: 'name',
      page_token: token
    )
  end
end

def render_file(dirname, file)
  write_csv(dirname, file)
end

ROOT_ID = ARGV[0]
ROOT_DIR_NAME = ARGV[1]

CSV_FILE_NAME = "#{ROOT_ID}.csv"

EXCLUDE_IDS = [
]

def render_folder(drive, folder, dirname)
  return if EXCLUDE_IDS.include? folder.id
  get_folders(drive, folder.id).each do |folder|
    render_folder(drive, folder, "#{dirname} / #{folder.name}")
  end
  CSV.open(CSV_FILE_NAME, 'a', force_quotes: true) do |csv|
    get_files(drive, folder.id).each do |file|
      owner = file.owners.first
      permissions = file.permissions&.map{ |x| "#{x.display_name} <#{x.email_address}>" }&.join(",")
      print dirname
      puts file.name
      csv << [
        dirname,
        file.name,
        "#{owner.display_name} <#{owner.email_address}>",
        file.created_time.strftime('%Y/%m/%d'),
        file.modified_time.strftime('%Y/%m/%d'),
        file.permissions&.size,
        permissions,
      ]
    end
  end
end

root = drive.get_file(ROOT_ID)

if ROOT_DIR_NAME
  render_folder(drive, root, ROOT_DIR_NAME)
else
  get_folders(drive, ROOT_ID).each do |folder|
    puts "#{folder.id} / #{folder.name}"
    render_folder(drive, folder, "#{root.name} / #{folder.name}")
  end
end

# https://www.rubydoc.info/github/google/google-api-ruby-client/Google/Apis/DriveV3/DriveService
# files = drive.list_files(
# )

# https://www.rubydoc.info/github/google/google-api-ruby-client/Google/Apis/DriveV3/FileList#files-instance_method
# files.files.each do |file|
#   # https://www.rubydoc.info/github/google/google-api-ruby-client/Google/Apis/DriveV3/File
#   puts file.name
# end

binding.pry

pp 'finish'
