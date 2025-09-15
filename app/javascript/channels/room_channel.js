import consumer from "./consumer"

export function init() {
  const messagesContainer = document.getElementById('messages')
  messagesContainer.scrollTop = messagesContainer.scrollHeight
  const roomElement = document.getElementById('room_id')
  if (!roomElement) return;

  const roomId = roomElement.value;
  console.log(roomId)

  const roomChannel = consumer.subscriptions.create({ channel: "RoomChannel", room_id: roomId }, {
    connected() {
      console.log('Connected to RoomChannel:', roomId)
    },

    disconnected() {
      console.log('Disconnected from RoomChannel:', roomId)
    },

    received(data) {
      console.log("Received broadcastレシーブ:", data.message)
      messagesContainer.insertAdjacentHTML('beforeend', data.message)

      const newMessage = messagesContainer.lastElementChild;
      if (!newMessage) return;

      const senderType = newMessage.dataset.senderType;
      console.log(senderType)
      console.log(window.currentUser.type)
      console.log(window.currentUser.type === senderType)
      
      newMessage.classList.remove('justify-content-start', 'justify-content-end');
      const bubble = newMessage.querySelector('.message');
      bubble.classList.remove('bg-light', 'bg-primary', 'text-dark', 'text-white');
      
      if ( senderType === window.currentUser.type) {
        newMessage.classList.add('justify-content-end');
        newMessage.querySelector('.message').classList.add('bg-primary', 'text-white');
      } else {
        newMessage.classList.add('justify-content-start');
        newMessage.querySelector('.message').classList.add('bg-light', 'text-dark');
      }
      messagesContainer.scrollTop = messagesContainer.scrollHeight
    }
  })

  const form = document.getElementById('new_message')
  form.addEventListener('submit', (event) => {
    console.log("送信")
    event.preventDefault()
    const content = document.getElementById('message_content').value.trim()
    if (content === '') return;

    roomChannel.perform('speak', {
      room_id: roomId,
      message: content,
      sender_type: document.getElementById('sender_type').value,
      sender_id: document.getElementById('sender_id').value
    })

    document.getElementById('message_content').value = ''
  })
}