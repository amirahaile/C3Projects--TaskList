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

  post "/" do
    @completed_tasks = params[:completed]
    q = TaskList::TaskMaster.new("taskList.db")

    q.update_tasks(@completed_tasks) if @completed_tasks != nil

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
    @message = q.add_task(@task_name, @description)
    @message == "" ? (redirect to "/") : (erb :add_task)
  end

  get "/delete/:task_id" do
    task_id = params[:task_id].to_i
    q = TaskList::TaskMaster.new('taskList.db')
    tasks = q.all_tasks
    @task = tasks.find { |task| task[0] == task_id }
    erb :delete
  end

  post "/delete/:task_id" do
    task_id = params[:task_id].to_i
    delete_task = params[:delete?]
    q = TaskList::TaskMaster.new('taskList.db')
    q.delete_task(task_id) if delete_task == "yes"
    redirect to "/"
  end

end
