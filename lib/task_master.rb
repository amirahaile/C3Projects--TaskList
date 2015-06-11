require "./lib/database.rb"

module TaskList

  class TaskMaster < Database

    def all_tasks

      # santitize/validate your arguments

      # prepare your statement
      statement = "SELECT * FROM taskList;"

      # call `query!` to interact with the database
      query!(statement)
      # determine what should be returned
    end

    def add_task(name, description)

      # santitize/validate your arguments

      # prepare your statement
      statement = "INSERT INTO taskList (task_name, description) VALUES ('#{name}', '#{description}');"
      # call `query!` to interact with the database
      query!(statement)
      # determine what should be returned
    end

  end #class
end #module
