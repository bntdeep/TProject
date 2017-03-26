package by.asushenya.total.controller;

import java.util.HashMap;
import java.util.Map;

import by.asushenya.total.controller.command.impl.ChangeLocalizationCommand;
import by.asushenya.total.controller.command.impl.GetAllUserRatesCommand;
import by.asushenya.total.controller.command.impl.GetPageWithGamesCommand;
import by.asushenya.total.controller.command.impl.GetPageWithUsersCommand;
import by.asushenya.total.controller.command.impl.GetPersonalPageCommand;
import by.asushenya.total.controller.command.impl.InitializeAddNewGamePageCommand;
import by.asushenya.total.controller.command.impl.authorization.SignOut;
import by.asushenya.total.controller.command.ICommand;


public final class CommandHelper {
	private static final CommandHelper instance = new CommandHelper();
	
	private Map<CommandName, ICommand> commands = new HashMap<>();
	
	public CommandHelper(){
	  /*depricated
	    commands.put(CommandName.GET_ALL_USER_RATES_COMMAND, new GetAllUserRatesCommand());
		commands.put(CommandName.GET_ALL_USERS_COMMAND, new GetAllUsersCommand());
		commands.put(CommandName.GET_PAGE_WITH_GAMES_COMMAND, new GetPageWithGamesCommand());
		commands.put(CommandName.GET_PERSONAL_PAGE_COMMAND, new GetPersonalPageCommand());
		commands.put(CommandName.LOCALIZATION_COMMAND, new LocalizationCommand());
		commands.put(CommandName.LOG_OUT_COMMAND, new LogOutCommand());
	  */
		
		commands.put(CommandName.GET_ALL_USER_RATES_COMMAND, new GetAllUserRatesCommand());
		commands.put(CommandName.GET_PAGE_WITH_GAMES_COMMAND, new GetPageWithGamesCommand());
		commands.put(CommandName.GET_PERSONAL_PAGE_COMMAND, new GetPersonalPageCommand());
		commands.put(CommandName.AUTHORIZATION_USER_SIGN_OUT_COMMAND, new SignOut());
		commands.put(CommandName.CHANGE_LOCALIZATION_COMMAND, new ChangeLocalizationCommand());
		commands.put(CommandName.GET_PAGE_WITH_USERS_COMMAND, new GetPageWithUsersCommand());
		commands.put(CommandName.INITIALIZE_ADD_NEW_GAME_PAGE_COMMAND, new InitializeAddNewGamePageCommand());
	}
	
	public static CommandHelper getInstance(){
		return instance;
	}
	
	public ICommand getCommand(String commandName){
		

		CommandName name = CommandName.valueOf(commandName.toUpperCase());
		ICommand command;
		if(null != name){
			command = commands.get(name);
		} else{
			command = commands.get(CommandName.NO_SUCH_COMMAND);
		}
		
		return command;
	}
}