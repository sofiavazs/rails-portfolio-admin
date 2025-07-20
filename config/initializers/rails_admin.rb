RailsAdmin.config do |config|
  config.asset_source = :sprockets

  config.included_models = [Project, User]

  # Authenticate with Devise
  config.authenticate_with do
    warden.authenticate! scope: :user
  end
  config.current_user_method(&:current_user)

  # Set the admin name
  config.main_app_name = ["Portfolio Admin", "Management Panel"]

  # Configure Project model
  config.model 'Project' do
    navigation_label 'Portfolio'

    list do
      field :name
      field :url
      field :github
      field :tags
      field :created_at
    end

    show do
      field :name
      field :description
      field :url do
        formatted_value do
          bindings[:view].link_to(value, value, target: '_blank') if value.present?
        end
      end
      field :github do
        formatted_value do
          bindings[:view].link_to(value, value, target: '_blank') if value.present?
        end
      end
      field :tags
      field :created_at
      field :updated_at
    end

    edit do
      group :basic_info do
        field :name
        field :description, :text
      end
      group :links do
        field :url, :string do
          help 'Full URL to the live project (e.g., https://pokemonexplorer.vercel.app/)'
        end
        field :github, :string do
          help 'Full URL to the GitHub repository'
        end
      end
      group :tags do
        field :tags, :serialized do
          help 'Add tags like: Frontend, React, TypeScript, etc.'
        end
      end
    end
  end


  # config.model 'Experience' do
  #   navigation_label 'Portfolio'
  #   list do
  #     field :job_title
  #     field :company
  #     field :start_date
  #     field :current
  #   end
  # end

  # config.model 'Profile' do
  #   navigation_label 'Portfolio'
  # end

  # config.model 'SocialLink' do
  #   navigation_label 'Portfolio'
  # end

  config.model 'User' do
    navigation_label 'Admin'
  end
end

