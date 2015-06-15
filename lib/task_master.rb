require "./lib/database.rb"

module TaskList

  class TaskMaster < Database

    def all_tasks
      statement = "SELECT * FROM taskList;"
      query!(statement)
    end

    def add_task(name, description)
      unless name == ""
        statement = "INSERT INTO taskList (task_name, description) VALUES ('#{name}', '#{description}');"
        query!(statement)
        return ""
      else
        return "Please enter task name."
      end
    end

    def update_tasks(completed_tasks)
      completed_tasks.each do |id|
        statement = "UPDATE taskList SET completed_date = '#{Time.new.strftime("%m/%d/%Y")}' WHERE id = '#{id}';"
        query!(statement)
      end
    end

    def delete_task(task_id)
      statement = "DELETE FROM taskList WHERE id = '#{task_id}';"
      query!(statement)
    end

  end #class
end #module
