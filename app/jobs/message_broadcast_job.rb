class MessageBroadcastJob < ApplicationJob 
  queue_as :default 
  def perform(message)
    ActionCable.server.broadcast "room-#{message.chatroom_id}:messages", message: render_message(message), chatroom_id: message.chatroom_id.to_s
  end 

  private 
    def render_message(message) 
      ApplicationController.renderer.render(partial: 'messages/message', locals: { message: message }) 
    end 
end
