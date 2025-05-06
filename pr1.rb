# ruby_tasks.rb

# 1. Дано цілочисельний масив. Вивести елементи з парними індексами, а потім з непарними.
data = [1, 2, 3, 4, 5, 6]
p (data.each_with_index.select { |_, i| i.even? } + data.each_with_index.select { |_, i| i.odd? }).map(&:first)

# 2. Дано цілочисельний масив. Вивести елементи з непарними індексами, а потім з парними.
data = [1, 2, 3, 4, 5, 6]
p (data.each_with_index.select { |_, i| i.odd? } + data.each_with_index.select { |_, i| i.even? }).map(&:first)

# 3. Дано масив. Вивести номер першого елемента: A[0] < A[i] < A[-1]
data = [5, 7, 2, 9, 4]
index = data.index { |x| data[0] < x && x < data[-1] }
p index || []

# 4. Дано масив. Вивести номер останнього елемента: A[0] < A[i] < A[-1]
data = [5, 7, 2, 9, 4]
index = data.rindex { |x| data[0] < x && x < data[-1] }
p index || []

# 5. Перетворити масив: до парних чисел додати перший елемент (перший і останній не змінювати)
data = [2, 4, 6, 8, 10]
first = data.first
new_data = data.map.with_index do |x, i|
  (i != 0 && i != data.length-1 && x.even?) ? x + first : x
end
p new_data

# 6. Замінити всі додатні елементи на мінімальне значення
data = [1, 3, -5, 0, -4, 9]
min_value = data.min
data.map! { |x| x.positive? ? min_value : x }
p data

# 7. Замінити всі від'ємні елементи на максимальне значення
data = [1, -3, -5, 0, -4, 9]
max_value = data.max
data.map! { |x| x.negative? ? max_value : x }
p data

# 8. Циклічний зсув елементів вліво на одну позицію
data = [1, 2, 3, 4, 5]
data.rotate!
p data

# 9. Циклічний зсув елементів вправо на одну позицію
data = [1, 2, 3, 4, 5]
data.rotate!(-1)
p data

# 10. Перевірити чи масив утворює арифметичну прогресію
data = [2, 4, 6, 8, 10]
diff = data[1] - data[0]
is_arithm = data.each_cons(2).all? { |a, b| b - a == diff }
p is_arithm ? diff : nil

# 11. Перевірити чи масив утворює геометричну прогресію
data = [2, 4, 8, 16]
ratio = data[1].to_f / data[0]
is_geom = data.each_cons(2).all? { |a, b| (b.to_f / a) == ratio }
p is_geom ? ratio : nil

# 12. Знайти кількість локальних максимумів
data = [1, 3, 2, 4, 1]
count = data.each_cons(3).count { |a, b, c| b > a && b > c }
p count

# 13. Знайти кількість локальних мінімумів
data = [1, 3, 2, 4, 1]
count = data.each_cons(3).count { |a, b, c| b < a && b < c }
p count

# 14. Знайти максимальний локальний максимум
data = [1, 7, 5, 3, 9, 8]
local_max = data.each_cons(3).select { |a, b, c| b > a && b > c }.map { |a, b, c| b }.max
p local_max

# 15. Знайти мінімальний локальний мінімум
data = [7, 5, 6, 3, 8, 2]
local_min = data.each_cons(3).select { |a, b, c| b < a && b < c }.map { |a, b, c| b }.min
p local_min

# ===============

# 2. Простий калькулятор

def calculator(a, b, operation)
  case operation
  when '+'
    a + b
  when '-'
    a - b
  when '*'
    a * b
  when '/'
    b != 0 ? a.to_f / b : 'Division by zero!'
  else
    'Invalid operation'
  end
end

puts calculator(10, 5, '+')  # 15
puts calculator(10, 5, '-')  # 5
puts calculator(10, 5, '*')  # 50
puts calculator(10, 5, '/')  # 2.0

# ===============

# 3. Геми для задач:

# 3.1 Сценарій: Регулярні фонові завдання (щотижневі мейли, генерація звітів опівночі)
Gem: sidekiq

# 3.2 Сценарій: Безпечне завантаження файлів у хмару
Gem: carrierwave + fog-aws

# 3.3 Сценарій: Організувати показ статей на сайті (пагінація)
Gem: kaminari
