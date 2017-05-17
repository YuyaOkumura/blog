module ArchiveHelper
  def year_month_conversion(year_month)
    year = year_month[0, 4]
    month = year_month[4, 2]
    return "#{year}年#{month}月"
  end

  def get_current_month(year_month)
    return DateTime.new(year_month[0, 4].to_i, year_month[4, 2].to_i ).all_month
  end
end
