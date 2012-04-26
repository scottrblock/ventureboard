module ApplicationHelper
  def link_to_add_major_fields(name, f, association)
    debugger
    object = current_user.majors.first 
    id = 1 
    fields = fields_for(association, object, child_index: id) do |builder|
      render(association.to_s.singularize + "_fields", f: builder )
    end
    link_to(name, '#', class: "add_fields", data: {id: id, fields: fields.gsub("\n", "")})  
  end
end
