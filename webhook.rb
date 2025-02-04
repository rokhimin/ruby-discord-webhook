require 'discordrb/webhooks'
require 'yaml'
  
data_url = YAML.load_file('data.yml')

WEBHOOK_URL = data_url['webhook_url'].freeze

client = Discordrb::Webhooks::Client.new(url: WEBHOOK_URL)
client.execute do |builder|
  builder.content = 'Hello world!'
  builder.add_embed do |embed|
    embed.title = 'Embed title'
    embed.description = 'Embed description'
    embed.timestamp = Time.now
  end
end







