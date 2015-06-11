require "./lib/database.rb"

module TaskList

  class TaskMaster < Database

    def add_task(*args)

      # santitize/validate your arguments

      # prepare your statement
      statement = "INSERT INTO taskList (task_name, description) VALUES (#{args[0]}, #{args[1]});"

      # call `query!` to interact with the database
      # new_task = TaskList::Database.new('taskList')
      # new_task.query!(statement)
      query!(statement)
      # determine what should be returned
    end



  end #class
end #module
