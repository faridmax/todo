require 'sinatra'
require 'shotgun'
require 'sinatra/activerecord'
require './environments'

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
get "/edit/:id" do
	@d = Donnees.find(params[:id])
	erb :edit
end
post "/edit/:id" do
	d = Donnees.find(params[:id])
	d.todo = params[:todo]
	d.date = params[:date]
	d.save
	redirect '/'
end 

