require 'telegram/bot'

token = "5790055473:AAHuKMsrb7iRWJJu1skoxVnHZfeY6lZxe6o"

Telegram::Bot::Client.run(token) do |bot|
  bot.listen do |message|
    bot.api.send_message(chat_id: message.chat.id, text: "Hello, #{message.from.first_name}! 3amel eh yasta ??")
  end
end
