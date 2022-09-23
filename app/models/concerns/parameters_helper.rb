# frozen_string_literal: true

module ParametersHelper
  def numerify_department
    self.department_id = department_id.send(:to_i) if department_id.present? && !department_id.nil?
  end

  def numerify_year
    self.department_id = year.send(:to_i) if year.present? && !year.nil?
  end

  def titleize_name
    self.name = name.send(:titleize) if name.present? && !name.nil?
  end
end
