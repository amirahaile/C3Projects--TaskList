require 'sinatra'
require 'sinatra/reloader'
require "./lib/task_master"

class MySite < Sinatra::Base
  register Sinatra::Reloader

  get "/" do
    erb :index
  end

  get "/add_task" do
    erb :add_task
  end

  post "/add_task" do
    @task_name = params[:task_name]
    @description = params[:description]

    task = TaskList::TaskMaster.new.add_task(@task_name, @description)
    erb :add_task
  end

end
