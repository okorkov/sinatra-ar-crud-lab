
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    redirect '/articles'
  end

  get '/articles' do 
    @articles = Article.all
    erb :index
  end

  get '/articles/new' do 
    erb :new
  end

  get '/articles/:id' do 
    @id = params[:id]
    @article = Article.find(@id)
    erb :show
  end

  delete '/articles/:id' do 
    Article.find(params[:id]).destroy
    redirect '/articles'
  end

  post '/articles' do 
    Article.create(title: params[:title], content: params[:content])
    redirect "/articles/#{Article.last.id}"
  end

  get '/articles/:id/edit' do
    @id = params[:id]
    @article = Article.find(@id)
    erb :edit
  end

  patch '/articles/:id' do 
    @patched = Article.find(params[:id])
    @patched.title = params[:title]
    @patched.content = params[:content]
    @patched.save
    redirect "/articles/#{@patched.id}"
  end


end

{"title"=>"is Alex Okarkau as famous as he seems to be?", 
"content"=>"Well the thing is that Alex Okarkau is just awesome and you kinda gotta 
deal with it and there is nothing you can do cause you cannot possibly
   be more awesome than Alex Okarkau so beat it loosers.",
  "_method"=>"patch", "id"=>"9"}