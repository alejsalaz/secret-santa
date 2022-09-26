# frozen_string_literal: true

json.data do
  json.id @game.id
  json.year @game.year
  json.couples do
    @game.couples.each_with_index do |couple, index|
      json.set! "couple_#{(@game.id + index + (@game.id != 1 ? @game.id * 2 - 2 : 0))
      .humanize.parameterize(separator: '_')}" do
        json.employees couple do |employee|
          json.name employee.name
          json.department employee.department.name
        end
      end
    end
  end

  if @game.leftover.nil? || @game.leftover == '[]'
    json.leftover 'no one was left alone this year :)'
  else
    json.leftover do
      json.leftover_id @game.leftover.split(',')[0].delete('^0-9')
      json.leftover_name @game.leftover.split(',')[1].split('"')[1]
      json.leftover_department Department.find_by(id: @game.leftover.split(',')[2].delete('^0-9')).name
    end
  end
end
