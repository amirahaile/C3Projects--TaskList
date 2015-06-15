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
      unless name == ""
        statement = "INSERT INTO taskList (task_name, description) VALUES ('#{name}', '#{description}');"
        query!(statement)
        return ""
      else
        return "Please enter task name."
      end
    end

    def update_tasks(completed_tasks)
      completed_tasks.map do |id|
        statement = "UPDATE taskList SET completed_date = '#{Time.new.strftime("%m/%d/%Y")}' WHERE id = '#{id}';"
          puts statement
        query!(statement)
      end
    end

    def delete_task(task_id)
      statement = "DELETE FROM taskList WHERE id = '#{task_id}';"
      query!(statement)
    end

  end #class
end #module
