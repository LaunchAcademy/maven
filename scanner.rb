require "./config/application"
require "./app/models/scan"

while true
  content = gets.chomp
  scan = Scan.new(content: content)
  result = scan.save

  File.open("log/scanner.log", "a") do |file|
    file.puts "[#{Time.now}] - scan: #{content} persisted?: #{result}"
  end
end
