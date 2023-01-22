module OrdersHelper
  def format_date(date_obj)
    date_obj.strftime('%B %d, %Y %H:%M')
  end
end
