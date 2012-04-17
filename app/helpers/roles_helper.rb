module RolesHelper
  def build_role_list(partialFile='')
    list_items = ""
    roleList = Role.find_by_sql("SELECT * FROM roles WHERE id NOT IN (SELECT role_id FROM role_roles)")
    logger.debug " >> " +roleList.map{|r| r.name}.join(',')  # debug
    for role in roleList
      list_items += build_role_list_item(role ,partialFile)
    end
    output = list_items
    logger.debug " >> output:  #{output}"  #debug
    return output.html_safe
  end
  
  def build_role_list_item(local_role,partialFile)
    local_children=""
    if local_role.children.length > 0
      child_output = ""
      for child in local_role.children
        child_output += build_role_list_item(child,partialFile)
      end
      local_children += render :partial => 'ul', :locals => { :list_items => child_output.html_safe }
    end
    output = render( :partial => partialFile, :locals => {:the_children => local_children.html_safe,:current_role => local_role})
    return output.html_safe
  end
  
end
