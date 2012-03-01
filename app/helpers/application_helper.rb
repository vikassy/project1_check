module ApplicationHelper

  def title_help(string)
    title1 = "Rails on Ruby Dicussion Forum" 
    if string.nil?
      title1
    else 
      " #{title1} | #{string}"
    end
  end     
end
