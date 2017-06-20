class MessagesController < ApplicationController
  before_action :find_channel, only: [:create, :destroy]

  def create
    pry-byebug
    @message = Message.new( user: current_user,
                            channel: @channel,
                            content: message_params[:content]
                          )
    if @message.save
      ActionCable.server.broadcast "room_channel_#{@channel.id}",
                                    channel_id: @channel.id,
                                    content:  @message.content,
                                    alias: current_user.alias
      ActionCable.server.broadcast "notification_channel",
                                    channel_id: @channel.id,
                                    total_messages: @channel.message.last.id,
                                    content:  @message.content

    end
  end
  #     redirect_to @channel
  #   else
  #     @messages = @channel.messages
  #     @channels = current_user.channels
  #     render 'channels/show'
  #   end
  # end

  def destroy
    @message = Message.find(params[:id])
    @message.destroy
    redirect_to @channel
  end

  private

  def find_channel
    @channel = Channel.find(params[:channel_id])
  end

  def message_params
    params.require(:message).permit(:content)
  end
end
