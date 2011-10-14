module ApplicationHelper
  #return a title
  def title
    base_title = "The Gorilla Project"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end
  def logo
    image_tag("logo_gorilla.png", :alt => "Project Gorilla")
  end
end
