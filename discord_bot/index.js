// Require the necessary discord.js classes
require('dotenv').config();
const { Client, Events, GatewayIntentBits } = require('discord.js');

// Create a new client instance
const client = new Client({
	intents: [
		GatewayIntentBits.Guilds,
		GatewayIntentBits.GuildMembers,
		GatewayIntentBits.GuildMessages,
		GatewayIntentBits.MessageContent,
	        ],
})
// Terminal message "Ready! Logged in as discord user tag variable"
client.once(Events.ClientReady, readyClient => {
	console.log(`Ready! Logged in as ${readyClient.user.tag}`);

})
// Create a new reply message
client.on('messageCreate', message => {
	if (message.author.bot) {
		return;
	}
	if (message.content === 'test') {
	message.reply('test');
	        	}
})
//Create a console output from any message
//client.on('messageCreate', message => {
//	console.log(message);



//})
// Create /help and /user <username> query
client.on('interactionCreate', interaction => {
	if (!interaction.isChatInputCommand()) return;
	if (interaction.commandName === 'help') {
		interaction.reply('```1. Use /user <username> to check when user was last in the voice channel \n2. To Do\n3. To Do\n4. To Do\n5. To Do```');
	};
	if (!interaction.isChatInputCommand()) return;
	if (interaction.commandName === 'user') {
		const userek = interaction.options.get('username').value;
		interaction.reply(`The name is ${userek}`)
	};
});
// Log in to Discord with your client's token
client.login(process.env.TOKEN);
