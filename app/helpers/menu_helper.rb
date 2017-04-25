module MenuHelper
  def menu_class(link_path, current_path)
    menu_class = "list-group-item"
    if link_path == current_path
      menu_class << " active"
    end
    return menu_class
  end
end
