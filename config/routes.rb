ActionController::Routing::Routes.draw do |map|
  map.resource :user
  map.resource :session
  map.resource :setting
  map.resources :book

  map.login 'login', :controller => 'sessions', :action => 'new'
  map.logout 'logout', :controller => 'sessions', :action => 'destroy'

  map.root :controller => 'docs', :action => 'index'
  map.docs 'index.:format', :controller => 'docs', :action => 'index', :conditions => {:method => :get}
  map.docs 'index.:format', :controller => 'docs', :action => 'create', :conditions => {:method => :post}
  map.find_doc 'find', :controller => 'docs', :action => 'index', :conditions => {:method => :get}
  map.new_doc 'new', :controller => 'docs', :action => 'new', :conditions => {:method => :get}
  map.edit_doc ':id/edit', :controller => 'docs', :action => 'edit', :conditions => {:method => :get}
  map.doc ':id', :controller => 'docs', :action => 'show', :conditions => {:method => :get}
  map.doc ':id', :controller => 'docs', :action => 'update', :conditions => {:method => :put}
  map.doc ':id', :controller => 'docs', :action => 'destroy', :conditions => {:method => :delete}
  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller

  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  # map.root :controller => "welcome"

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing the them or commenting them out if you're using named routes and resources.
end
