require 'sinatra'
require 'shotgun'
require 'sinatra/activerecord'

set :database,  "sqlite3:donnees_db.sqlite3"

class Donnees < ActiveRecord::Base
end

get "/" do
	@datas = Donnees.all
	erb :index
end
post "/datas" do
	Donnees.create(params)
	erb :datas
	redirect '/'
end
get "/delete/:id" do
    Donnees.destroy(params[:id])
	redirect '/'
end
