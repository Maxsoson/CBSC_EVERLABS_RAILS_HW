require 'json'

begin
  file = File.read('users.json')
  users = JSON.parse(file)

  puts "\nСписок користувачів:".center(40, '-')
  total_age = 0

  users.each do |user|
    puts "Name: #{user['name']}, Age: #{user['age']}"
    total_age += user['age'].to_i
  end

  average_age = users.size > 0 ? total_age.to_f / users.size : 0
  puts "\nСередній вік: #{format('%.2f', average_age)}"

rescue Errno::ENOENT
  puts "Файл users.json не знайдено."
rescue JSON::ParserError => e
  puts "Помилка при зчитуванні JSON: #{e.message}"
end
