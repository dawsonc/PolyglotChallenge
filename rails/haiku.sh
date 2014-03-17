rails new haiku
cd haiku
rails generate controller haiku index
echo "<p>This is a webapp</p><p>There are many like it but</p><p>This webapp is mine</p>" > app/views/haiku/index.html.erb
echo "Haiku::Application.routes.draw do
  get 'haiku/index'
  root 'haiku#index'
end" > config/routes.rb
rails server