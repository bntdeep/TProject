package by.asushenya.total.logic.impl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import by.asushenya.total.bean.Game;
import by.asushenya.total.bean.Rate;
import by.asushenya.total.bean.User;
import by.asushenya.total.bean.util.GameKind;
import by.asushenya.total.dao.exception.DAOException;
import by.asushenya.total.dao.factory.DAOFactory;
import by.asushenya.total.logic.CommandException;
import by.asushenya.total.logic.ICommand;

public class GetGamesByKindCommand implements ICommand{

	@Override
	public String execute(HttpServletRequest request) throws CommandException {
				
		List<Game> games = null;
			
		try {
			System.out.println("Game kind "+ request.getParameter("game_kind"));
		GameKind gameType =GameKind.valueOf(request.getParameter("game_kind").toUpperCase());		
			
		 games = DAOFactory.getInstance().getUserDAO().getGamesByType(gameType);
		
		
		} catch (DAOException e) {
			
			e.printStackTrace();
		}				
		request.setAttribute("games", games);	
		request.setAttribute("game_kind", request.getParameter("game_kind").toUpperCase());
		request.setAttribute("makeRateError", request.getParameter("makeRateError"));
		
		return request.getParameter("go_to_page");
	}

}
