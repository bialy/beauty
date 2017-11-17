module ApplicationHelper
 def nav_link_to(link_text, link_path)
    class_name = current_page?(link_path) ? 'active' : ''

    content_tag(:li, :class => class_name) do
      link_to link_text, link_path
    end
  end
  
  def title(page_title, options={})
    content_for(:title, page_title.to_s + " Salon Urody Beauty Expert Koszalin - Kosmetolog Kosmetyczka Anna Sikora")
    return content_tag(:h1, page_title, options)
  end
  
  def find_search
    @search = Offer.search(params[:search])
  end
  
  def popular_treatments
    @populars = Offer.find(:all, :order => 'visits_count desc limit 10')
  end
  
  def meta_keywords(tags = nil)
    if tags.present?
      content_for :meta_keywords, tags
    else
      content_for?(:meta_keywords) ? content_for(:meta_keywords) : APP_CONFIG['meta_keywords']
    end
  end
  
   def meta_description(desc = nil)
    if desc.present?
      content_for :meta_description, desc
    else
      content_for?(:meta_description) ? content_for(:meta_description) : APP_CONFIG['meta_description']
    end
  end

end
