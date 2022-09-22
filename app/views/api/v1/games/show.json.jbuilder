# frozen_string_literal: true

json.data do
  json.year @game.year
  json.couples do
    @game.couples.each_with_index do |couple, index|
      json.set! "couple_#{(@game.id + index + 1).humanize.parameterize(separator: '_')}" do
        json.employees couple do |employee|
          json.name employee.name
          json.department employee.department.name
        end
      end
    end
  end

  if @game.leftover
    json.leftover do
      json.leftover_id @game.leftover.split(',')[0].delete('^0-9')
      json.leftover_name @game.leftover.split(',')[1].split('"')[1]
      json.leftover_department Department.find_by(id: @game.leftover.split(',')[2].delete('^0-9')).name
    end
  else
    json.leftover 'no one was left alone this year :)'
  end
end
