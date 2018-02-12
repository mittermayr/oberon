require 'json'
require 'telegram/bot'
require './database'
require './tools'

# Telegram Token
token = ""

# Write a PID file so we can be killed... and restarted.
Tools::write_pid

Telegram::Bot::Client.run(token) do |bot|
  bot.listen do |message|

    # Check global commands
    case message.text
      when '/version'
        bot.api.send_message(chat_id: message.chat.id, text: "Oberon 0.1")
      when '/photo'
        bot.api.send_photo(chat_id: message.chat.id, photo: "https://cdn.pixabay.com/photo/2014/05/27/23/32/matrix-356024_960_720.jpg")
      when '/location'
        bot.api.send_location(chat_id: message.chat.id, latitude: -37.807416, longitude: 144.985339)
    end

    # Ensure user exists
    #Database.user_create(message.from.id) unless Database.user_exists(message.from.id)
    #user = Database.user_by_id(message.from.id)

  end
end
