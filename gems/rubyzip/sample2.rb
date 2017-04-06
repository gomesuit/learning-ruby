require 'zip'
require 'pry'

Zip::File.open('13tokyo.zip') do |zip_file|
  # Handle entries one by one
  zip_file.each do |entry|
    # Extract to file/directory/symlink
    # puts "Extracting #{entry.name}"
    # entry.extract(dest_file)

    # Read into memory
    content = entry.get_input_stream.read
    binding.pry
  end

  # Find specific entry
  # entry = zip_file.glob('*.csv').first
  # puts entry.get_input_stream.read
end
