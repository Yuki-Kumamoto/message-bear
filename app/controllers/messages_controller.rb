class MessagesController < ApplicationController
    before_action :set_message, only: [:show, :edit, :update, :destroy]
    
    def index
        @messages = Message.all.page(params[:page])
    end
    
    def show
        set_message
    end
    
    def new
        @message = Message.new
    end
    
    def create
        @message = Message.new(message_params)
        
        if @message.save
            flash[:success] = "Messageが正常に投稿されました"
            redirect_to @message
        else
            flash.now[:danger] = "Messageが投稿されませんでした"
            render :new
        end
    end
    
    def edit
        set_message
    end
    
    def update
        set_message
        
        if @message.update(message_params)
          flash[:success] = "Message は正常に更新されました"
          redirect_to @message
        else
          flash.now[:danger] = "Message は更新されませんでしたs"
          render :edit
        end
    end
    
    def destroy
        set_message
        @message.destroy
        
        flash[:success]
        redirect_to messages_url
    end
    
end
    
    private
    
    def set_message
        @message = Message.find(params[:id])
    end

    
    def message_params
        params.require(:message).permit(:content, :title)   
    end