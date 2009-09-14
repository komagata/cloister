ActionController::Routing::Routes.draw do |map|
  map.root :controller => 'docs', :action => 'index'
  map.root_for_yahoo "/index.html", :controller => 'docs', :action => 'index'
  map.docs 'index.:format', :controller => 'docs', :action => 'index', :conditions => {:method => :get}
  map.docs 'index.:format', :controller => 'docs', :action => 'create', :conditions => {:method => :post}
  map.find_doc 'find', :controller => 'docs', :action => 'index', :conditions => {:method => :get}
  map.new_doc 'new', :controller => 'docs', :action => 'new', :conditions => {:method => :get}
  map.edit_doc ':id/edit', :controller => 'docs', :action => 'edit', :conditions => {:method => :get}
  map.doc ':id', :controller => 'docs', :action => 'show', :conditions => {:method => :get}
  map.doc ':id', :controller => 'docs', :action => 'update', :conditions => {:method => :put}
  map.doc ':id', :controller => 'docs', :action => 'destroy', :conditions => {:method => :delete}
end
