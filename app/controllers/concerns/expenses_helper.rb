module ExpensesHelper
  
  def get_number_of_days(month, year)
    days = Time.days_in_month(month.to_i, year).to_s
  end

end