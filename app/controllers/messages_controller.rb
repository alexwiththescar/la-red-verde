class MessagesController < ApplicationController
  
  before_filter :set_user
  before_filter :authenticate_user!
  before_filter :correct_user
  
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
    @swapproducts = User.find(current_user).farms.includes(:products).collect{|u| u.products}.flatten
   

     if params[:reply_to]
      @reply_to = @user.received_messages.find(params[:reply_to])
        unless @reply_to.nil?
        @name =  @reply_to.sender.login
        @message.to = @reply_to.sender.id
        @message.subject = "Re: #{@reply_to.subject}"
        @message.body = "\n\n*Original message*\n\n #{@reply_to.body}"
        end
      
      elsif params[:replyto]
        @message.to = User.find(params[:replyto]).id
        @name = User.find(params[:replyto]).name
      
      elsif params[:product]
        @message.to = User.find(params[:product]).id
        @name = User.find(params[:product]).name
        @productname = Product.find(params[:productname]).name
        @message.subject = "A message about your #{@productname}..."


     end
  
    


  end
 
  
  def create
    @message = Message.new(params[:message])
    @message.sender = @user
    @message.recipient = User.find(params[:message][:to])

    if @message.save
      flash[:notice] = "Message sent"
      UserMailer.newmessage_email(@message.recipient).deliver!
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
      @user = current_user
    end

    def correct_user
    @user = User.find(params[:user_id])
    redirect_to user_message_path unless current_user == @user
  end
end

