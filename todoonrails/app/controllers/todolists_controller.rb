class TodolistsController < ApplicationController
    def index
        @todos = Todolist.all
    end
    
    def show
        @todo = Todolist.find(params[:id])
    end

    def new
        @todo = Todolist.new
    end

    def edit
        @todo = Todolist.find(params[:id])
    end
     
    def create
        @todo = Todolist.new(todo_params)
       
        if @todo.save
            redirect_to @todo
        else
            render 'new'
        end

      end
    
    def update
        @todo = Todolist.find(params[:id])
        
        if @todo.update(todo_params)
            redirect_to @todo
        else
            render 'edit'
        end
    end

    def destroy
        @todo = todo.find(params[:id])
        @todo.destroy
       
        redirect_to todos_path
      end
        
    private
        def todo_params
            params.require(:todo).permit(:description, :priority, :duedate)
        end
end
