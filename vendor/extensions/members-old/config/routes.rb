Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :members do
    resources :members, :path => '', :only => [:index, :show]
    match ':state_id/:id' => 'members#show', as: "state_members"
  end

  # Admin routes
  namespace :members, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :members, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end


  # Frontend routes
  namespace :states do
    resources :states, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :states, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :states, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end