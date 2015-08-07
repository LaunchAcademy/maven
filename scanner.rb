require "./config/application"

def db_connection
  begin
    connection = PG.connect(dbname: ActiveRecord::Base.connection.current_database)
    yield(connection)
  ensure
    connection.close
  end
end

def exec_query(sql, params = [])
  result = db_connection do |connection|
    connection.exec(sql, params).to_a
  end
  result
end

while true
  content = gets.chomp

  sql = <<-SQL
    INSERT INTO scans(content, created_at, updated_at)
    VALUES ($1, $2, $3)
    RETURNING id;
  SQL
  result = exec_query(sql, [content, Time.now, Time.now])

  File.open("logs/maven.log", "a") do |file|
    file.puts "[#{Time.now}] - scan: #{content} db_response: #{result.join}"
  end
end
