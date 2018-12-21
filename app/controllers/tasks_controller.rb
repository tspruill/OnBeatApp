class TasksController < ApplicationController
   before_action :find_by_ID, only: [:show,:edit,:destroy,:update]
    
    
    def index
        @tasks = Task.all.order("created_at DESC")
    end
    def new
        @task = Task.new
    end 
    def create 
        @task = Task.new(task_params)
        if @task.save
            redirect_to root_path
        else 
            render'new'
        end 
    end 
    
    
    def show
       
    end 
    def edit 
    
    end 
    
    def update 
        if @task.update(task_params)
            redirect_to task_path(@task)
        else
            render 'edit'
        end
    end 
    
    def destroy 
        @taks.destroy
        redirect_to root_path
    end 
    
    
    
    private 
    def task_params
        params.require(:task).permit(:title,:description)
    end
    
    def find_by_ID
         @task = Task.find(params[:id])
    end 
end
