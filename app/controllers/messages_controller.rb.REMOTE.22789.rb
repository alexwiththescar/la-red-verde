class MessagesController < ApplicationController
  
  before_filter :set_user
  before_filter :authenticate_user!
  before_filter :correct_user, only: [:edit, :update, :destroy]
  
  def index
    if params[:mailbox] == "sent"
      @messages = @user.sent_messages
    else
      @messages = @user.received_messages
    end
  end
  
  def show
    @message = Message.read_message(params[:id], current_user)
  end
  
  def new
    @message = Message.new

    if params[:reply_to]
      @reply_to = @user.received_messages.find(params[:reply_to])
     
        @message.to = @reply_to.sender.id
        @message.subject = "Re: #{@reply_to.subject}"
        @message.body = "\n\n*Original message*\n\n #{@reply_to.body}"
      
    elsif params[:user_id]
        @message.to = User.find(params[:user_id]).id 
end
      if params[:farm_id]
        
        @message.subject = "Re: #{@farm_id}"
    end
  end
  
  
  def create
    @message = Message.new(params[:message])
    @message.sender = @user
    @message.recipient = User.find(params[:message][:to])

    if @message.save
      flash[:notice] = "Message sent"
      redirect_to user_messages_path(@user)
    else
      render :action => :new
    end
  end
  
  def delete_selected
    if request.post?
      if params[:delete]
        params[:delete].each { |id|
          @message = Message.find(:first, :conditions => ["messages.id = ? AND (sender_id = ? OR recipient_id = ?)", id, @user, @user])
          @message.mark_deleted(@user) unless @message.nil?
        }
        flash[:notice] = "Messages deleted"
      end
      redirect_to :back
    end
  end
  
  private
    def set_user
      @user = User.find(params[:user_id])
    end
    def correct_user
    @foo = Messages.find params[:id]
    redirect_to signup_path unless current_user == @messages.user
  end
end



