module ApplicationHelper
  ALERT_TYPES = [:danger, :info, :success, :warning]
  def bootstrap_flash
    flash_messages = []
    flash.each do |type, message|
      #puts "[FLASH] #{type}, #{message}"
      next if message.blank?

      type = :success if type == 'notice'
      type = :warning if type == 'alert'
      type = :danger if type == 'error'
      #next unless ALERT_TYPES.include?(type)

      Array(message).each do |msg|
        text = content_tag(:div,
                 content_tag(:button, raw("&times;"), :class => "close", "data-dismiss" => "alert") + raw(msg), :class => "alert fade in alert-#{type}")
        flash_messages << text if msg
      end
    end
    flash_messages.join("\n")
  end

	def controller?(*controller)
    controller.include?(params[:controller])
  end

  def action?(*action)
    action.include?(params[:action])
  end

	def format_dec(val)
		if val
			number_with_delimiter('%.2f' % val)
		else
			''
		end
	end

  def toolbox_button(title, url, options = {})
    options[:title] = title
    options[:class] = 'btn btn-info btn-sm'
    link_to(raw('<i class="icon-pencil"></i> ' + title), url, options)
  end
  def status_text(obj)
    return 'nil obj' unless obj
    return 'nil' unless obj.status
    classname = obj.class.name
    if classname == 'GodownEntry'
      %w"新单 已入库 xx xx xx xx"[obj.status]
    elsif classname == 'GodownItem'
      %w"新单 已入库 xx xx xx xx"[obj.status]
    elsif classname == 'Order'
      %w"[新单] 已出库 已付款 结清 xx xx"[obj.status]
    else
      "(#{classname}: #{obj.status})"
    end
  end
  def object_url(object, options = {})
    send "#{object.class.name.underscore.split('/').last}_path", object, options
  end

  def l(dt)
    "#{dt.strftime('%Y-%m-%d')}" if dt 
  end
  def sheet_name(sheet)
    if sheet.is_a? Order
      if sheet.partner
        "#{sheet.partner.partner_name} (订单:#{sheet.id})"
      else
        "订单: #{sheet.id}"
      end
    elsif sheet.is_a? GodownEntry
      "入库单: #{sheet.godown_number}"
    else
      "#{sheet.class}(#{sheet.id})"
    end
  end
end
