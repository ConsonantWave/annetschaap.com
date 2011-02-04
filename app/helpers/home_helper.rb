module HomeHelper
  def area_tag(title, url, id, shape, coords, options = { })
    output = "<area "
    output += 'id="' + id + '" '
    output += 'alt="' + title + '" title="' + title + '" '
    output += 'shape="' + shape + '" coords="' + coords + '" '
    output += 'href="' + url + '" '
    options.each do |key, value|
      case key
      when :active
        if value
          output += 'class="activeLink" '
        end
      when :target
        output += 'target="' + value + '" '
      end
    end
    return output + "/>"
  end
  
  def category_area_tag(category, shape, coords)
    if category
      return area_tag(category.name, category_path(category), "a_categories_" + category.id.to_s, shape, coords, :active => true)
    else
      return ''
    end
  end
end
