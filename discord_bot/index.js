// Require the necessary discord.js classes
const { Client, Events, GatewayIntentBits } = require('discord.js');
const { token } = require('./config.json');

// Create a new client instance
const client = new Client({
	    intents: [
		            GatewayIntentBits.Guilds,
		            GatewayIntentBits.GuildMessages,
		            GatewayIntentBits.MessageContent,
		        ],
})
// Terminal message "Ready! Logged in as discord tag variable"
client.once(Events.ClientReady, readyClient => {
		console.log(`Ready! Logged in as ${readyClient.user.tag}`);

})
// Create a new reply message
client.on('messageCreate', message => {
	    if (message.content === 'test') {
		message.reply('działa!');
	        	}
})

// Log in to Discord with your client's token
client.login(token);