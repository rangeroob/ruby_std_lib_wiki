require 'cuba'
require 'rack/protection'
require "cuba/render"
require 'erb'
require 'sequel'

Cuba.use Rack::Session::Cookie, :secret => "iCVNryAJtHlJwCdhBQrR08C2MfWF2DDDjC/lwJXJ+SZ4alsQi4El+dAy0KH52TUXG7cL9LL8sGJkg0zMl1qUJg=="

Cuba.use Rack::Protection
Cuba.use Rack::Protection::RemoteReferrer

# connect to a database
DB = Sequel.connect('sqlite://db/ruby.db', :max_connections=>200)

# create a dataset from the items table
posts = DB[:posts]

Cuba.use Rack::Static, root: "public", urls: ["/css"]
Cuba.use Rack::Static, root: "public", urls: ["/imgs"]
Cuba.use Rack::Static, root: "public", urls: ["/js"]

Cuba.plugin(Cuba::Render)


Cuba.settings[:render][:template_engine] = "erb"
Cuba.settings[:render][:views] = "./views"

# To launch just type: 'rackup' in your console
Cuba.define do
  on get do

    on root do
	  @css = "<link rel='stylesheet' type='text/css' href='/css/style.css'>"
	  where_post =  posts.where[:title =>'ARRAY']
	  @title = where_post.fetch(:title)
	  @front_body = where_post.fetch(:body)
      res.write view ("layout")
    end
  
  end
end

