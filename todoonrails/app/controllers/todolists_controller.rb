class TodolistsController < ApplicationController
    def index
        @todos = Todolist.all
    end
    
    def show
        
        return not_found unless Todolist.exists?(id: params[:id])
        
        @todo = Todolist.find(params[:id])
    end

    def new
        @todo = Todolist.new
    end

    def edit
        
        return not_found unless Todolist.exists?(id: params[:id])

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
        
        return not_found unless Todolist.exists?(id: params[:id])

        @todo = Todolist.find(params[:id])
        
        if @todo.update(todo_params)
            redirect_to @todo
        else
            render 'edit'
        end
    end

    def destroy
        
        return not_found unless Todolist.exists?(id: params[:id])

        @todo = Todolist.find(params[:id])
        
        @todo.destroy
       
        redirect_to todolists_path
      end
        
    private
        def todo_params
            params.require(:todo).permit(:description, :priority, :duedate)
        end
    
    def not_found
        raise ActionController::RoutingError.new('Not Found')
        end
end
