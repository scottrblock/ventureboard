module ApplicationHelper
  def link_to_add_fields(name, f, association)
    debugger
    object = f.object.send(association).klass.new
    id = 1 
    fields = fields_for(association, object, child_index: id) do |builder|
      render(association.to_s.singularize + "_fields", f: builder )
    end
    link_to(name, '#', class: "add-fields field-add-" + association.to_s.singularize, data: {id: id, fields: fields.gsub("\n", "")})  
  end
end
