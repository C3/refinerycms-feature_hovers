Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :feature_hovers do
    resources :feature_hovers, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :feature_hovers, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :feature_hovers, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
