require 'sinatra'
require 'sinatra/reloader'
require "./lib/task_master"

class MySite < Sinatra::Base
  register Sinatra::Reloader

  get "/" do
    q = TaskList::TaskMaster.new("taskList.db")
    @tasks = q.all_tasks
    erb :index
  end


  get "/add_task" do
    erb :add_task
  end

  post "/add_task" do
    @task_name = params[:task_name]
    @description = params[:description]

    q = TaskList::TaskMaster.new('taskList.db')
    q.add_task(@task_name, @description)
    redirect to "/"
  end

end
