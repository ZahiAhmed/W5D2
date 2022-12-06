# == Schema Information
#
# Table name: nobels
#
#  yr          :integer
#  subject     :string
#  winner      :string

require_relative './sqlzoo.rb'

def physics_no_chemistry
  # In which years was the Physics prize awarded, but no Chemistry prize?
  execute(<<-SQL)
  SELECT
    DISTINCT(physics_years.yr)
  FROM 
    nobels AS physics_years
  JOIN
    nobels AS chemistry_years
  ON
    physics_years.subject = chemistry_years.subject
  WHERE
    physics_years.subject = 'Physics';
  SQL
end
