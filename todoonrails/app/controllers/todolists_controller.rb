class TodolistsController < ApplicationController
    def new
    end
    def index
        @todos = Todolist.all
    end
     
    def show
        @todo = Todolist.find(params[:id])
    end

    def create
        @todo = Todolist.new(todo_params)
       
        @todo.save
        redirect_to @todo
      end
       
      private
        def todo_params
          params.require(:todos).permit(:description)
        end
    
end
