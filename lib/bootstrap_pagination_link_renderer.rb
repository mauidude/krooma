class BootstrapPaginationLinkRenderer < WillPaginate::ActionView::LinkRenderer
  protected

  def page_number(page)
    @last_page = page

    if page != current_page
      tag(:li, link(page, page, :rel => rel_value(page)))
    else
      tag(:li, link(page, page), :class => "active")
    end
  end

  def previous_or_next_page(page, text, classname)
    if page
      tag(:li, link(text, page), :class => classname)
    else
      tag(:li, link(text, page), :class => classname + ' disabled')
    end
  end

  def html_container(html)
    ul = tag(:ul, html)
    tag(:div, ul, container_attributes)
  end

  def gap
    text = @template.will_paginate_translate(:page_gap) { '&hellip;' }
    tag(:li, link(text, @last_page + 1), :class => "gap")
  end

end