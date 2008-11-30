module WillPaginate::ViewHelpers
  def will_paginate_with_default(collection = nil, options = {})
    
    will_paginate_without_default(collection, {
      :previous_label => '&laquo;',
      :next_label => '&raquo;'}.update(options))
  end
  alias_method_chain :will_paginate, :default
end
