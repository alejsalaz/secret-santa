# frozen_string_literal: true

ActiveRecord::Schema[7.0].define(version: 20_220_923_153_812) do
  create_table 'departments', force: :cascade do |t|
    t.string 'name', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'employees', force: :cascade do |t|
    t.string 'name', null: false
    t.integer 'department_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'games', force: :cascade do |t|
    t.integer 'year', null: false
    t.text 'leftover', null: false
    t.text 'couples', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end
end
