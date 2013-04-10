module PostsHelper

  def set_url(url)
    if url.scan("http://").empty?
      "http://#{url}"
    else
      return url
    end
  end

  def find_and_order_children(comment)
    children = @comments.select { |comm| comm.parent_id == comment.id }
    children.sort_by { |child| child.created_at }.reverse
  end

  def print_comment_tree
    str = ""
    @comments.select{|comment| comment.parent_id == nil}.each do |top_level|
      indent = 0
      str += print_comment_and_children(top_level, indent)
      str += "<br>"
      #binding.pry
    end
    str.html_safe
  end

  def print_comment_and_children(comment, indent)
    #binding.pry
    html = "<div class='indent_#{indent}'>#{comment.body} | <a href='/comments/#{comment.id}'>link</a></div>"
    # print comment with class indent-#{indent}
    if find_and_order_children(comment).empty?
      # REV Why not do unless if you're not using the if bit?
    else
      find_and_order_children(comment).each do |sub_comment|
        html << print_comment_and_children(sub_comment, indent + 1)
      end
    end
    html
  end

  def print_comment_tree_comment_page
    str = ""
    str += print_comment_and_children(@comment, 0)
    str.html_safe
  end

  def calc_points(post_id)
    Vote.where("post_id = ?", post_id).count
  end

end
