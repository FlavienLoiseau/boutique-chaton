module ApplicationHelper
  def bootstrap_class_for_flash(type)
    case type
      when 'notice' then "alert-info"
      when 'success' then "alert-success"
      when 'error' then "alert-danger"
      when 'alert' then "alert-warning"
    end
  end

  def number_items(user)
    user.carts.last.line_items.count
  end

  def sum_items(user)
    user.carts.last.line_items.to_a.sum(&:line_item_total)
  end
end
