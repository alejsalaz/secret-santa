# frozen_string_literal: true

json.data do
  @games.each_with_index do |game, game_index|
    json.set! "game_#{(game_index + 1).humanize.parameterize(separator: '_')}" do
      json.year game.year

      json.couples do
        game.couples.each_with_index do |couple, couple_index|
          json.set! "couple_#{(game.id + couple_index + (game.id != 1 ? game.id * 2 - 2 : 0)).humanize.parameterize(separator: '_')}" do
            json.employees couple do |employee|
              json.name employee.name
              json.department employee.department.name
            end
          end
        end
      end

      if game.leftover.nil? || game.leftover == '[]'
        json.leftover 'no one was left alone this year :)'
      else
        json.leftover do
          json.leftover_name game.leftover.split(',')[1].split('"')[1]
          json.leftover_department Department.find_by(id: game.leftover.split(',')[2].delete('^0-9')).name
        end
      end
    end
  end
end
