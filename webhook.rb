require 'discordrb/webhooks'
require 'yaml'
  
data_url = YAML.load_file('data.yml')

WEBHOOK_URL = data_url['webhook_url'].freeze

client = Discordrb::Webhooks::Client.new(url: WEBHOOK_URL)
client.execute do |builder|
  builder.content = 'Hello world!'
  builder.username = 'whdzera'
  builder.avatar_url = 'https://i.imgur.com/PcMltU7.jpg'
  builder.add_embed do |embed|
    embed.colour = '#ffffff'
    embed.title = 'Embed title'
    embed.url = 'https://github.com/rokhimin' #make embed title linkable
    embed.description = 'Embed description'
    embed.timestamp = Time.now
    embed.image = Discordrb::Webhooks::EmbedImage.new(url: 'https://i.imgur.com/PcMltU7.jpg')
    embed.thumbnail = Discordrb::Webhooks::EmbedThumbnail.new(url: 'https://i.imgur.com/PcMltU7.jpg')
    embed.author = Discordrb::Webhooks::EmbedAuthor.new(name: 'whdzera author', url: 'https://github.com/rokhimin', icon_url: 'https://i.imgur.com/PcMltU7.jpg')
    embed.footer = Discordrb::Webhooks::EmbedFooter.new(text: 'text footer', icon_url: 'https://i.imgur.com/PcMltU7.jpg')
  end
end







