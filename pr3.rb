tasks = []

loop do
  puts "\n1. Додати задачу"
  puts "2. Показати задачі"
  puts "3. Видалити задачу"
  puts "4. Вийти"
  print "\nОберіть опцію: "
  choice = gets.chomp

  case choice
  when "1"
    print "Введіть нову задачу: "
    task = gets.chomp.strip
    if task.empty?
      puts "Задача не може бути порожньою."
    else
      tasks << task
      puts "Задачу додано!"
    end

  when "2"
    if tasks.empty?
      puts "\nНемає жодної задачі."
    else
      puts "\nПоточні задачі:"
      tasks.each_with_index do |task, index|
        puts "#{index + 1}. #{task}"
      end
    end

  when "3"
    if tasks.empty?
      puts "\nНемає задач для видалення."
      next
    end
    puts "\nВведіть номер задачі для видалення:"
    tasks.each_with_index do |task, index|
      puts "#{index + 1}. #{task}"
    end
    print "Номер: "
    number = gets.chomp.to_i
    if number.between?(1, tasks.length)
      removed = tasks.delete_at(number - 1)
      puts "Задачу '#{removed}' видалено."
    else
      puts "Невірний номер."
    end

  when "4"
    puts "Вихід... До побачення!"
    break

  else
    puts "Невірна опція. Спробуйте ще."
  end
end
