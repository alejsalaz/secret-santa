# frozen_string_literal: true

3.times do
  name = Faker::Company.unique.industry.gsub(/[^[a-zA-Zá-úÁ-ÚÑñ ]+$]/, '')
  Department.create!(name: name)
end

7.times do
  name = Faker::Name.unique.name.gsub(/[^[a-zA-Zá-úÁ-ÚÑñ ]+$]/, '')
  number = rand(1..3)
  Employee.create!(name: name, department_id: number)
end

(2022..2031).to_a.each do |year|
  Game.create!(year: year)
end
