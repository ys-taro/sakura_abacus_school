class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_for Room.find(params[:room_id])
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    room = Room.find(data['room_id'])
    message = room.messages.create!(
      content: data['message'],
      sender_type: data['sender_type'],
      sender_id: data['sender_id']
    )
    RoomChannel.broadcast_to(room, {
      message: render_message(message)
    })
  end

  private
  def render_message(message)
      Rails.logger.debug "センダータイプは #{message.sender_type}"
      ApplicationController.renderer.render(
        partial: 'messages/message',
        locals: { message: message }
      )
  end
end
