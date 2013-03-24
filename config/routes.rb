ActionController::Routing::Routes.draw do |map|

  map.root :controller => "venues"

  map.new_splash_ad_venue 'splash_ads/new/:venue_id', :controller => 'splash_ads', :action => 'new'

  map.new_advertisement_venue 'advertisements/new/:venue_id', :controller => 'advertisements', :action => 'new'

  map.new_schedule_venue 'schedules/new/:venue_id', :controller => 'schedules', :action => 'new'

  map.new_event_schedule 'events/new/:schedule_id', :controller => 'events', :action => 'new'

  map.resources :weather_boxes

  map.resources :venues

  map.resources :displays

  map.connect 'displays/:id/banner', :controller => 'displays', :action => 'banner'

  map.connect 'displays/:id/frame', :controller => 'displays', :action => 'frame'

  map.connect 'displays/:id/content', :controller => 'displays', :action => 'content'

  map.resources :users

  map.resources :time_boxes

  map.resources :splash_ads

  map.resources :schedules

  map.connect 'schedules/:schedule_id/events.:format', :controller => 'events', :action => 'index'

  map.resources :events

  map.resources :advertisements

  map.connect 'sessions/create', :controller => 'sessions', :action => 'create'

  map.connect 'sessions/destroy', :controller => 'sessions', :action => 'destroy'

  map.login 'login', :controller => 'sessions', :action => 'new'

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
  # consider removing or commenting them out if you're using named routes and resources.
  #map.connect ':controller/:action/:id'
  #map.connect ':controller/:action/:id.:format'
end
