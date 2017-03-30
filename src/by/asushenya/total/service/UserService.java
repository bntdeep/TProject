package by.asushenya.total.service;

import java.util.List;
import java.util.Locale;

import by.asushenya.total.bean.Game;
import by.asushenya.total.bean.GamesPage;
import by.asushenya.total.bean.Rate;
import by.asushenya.total.bean.User;
import by.asushenya.total.bean.util.GameKind;
import by.asushenya.total.bean.util.RateChoice;
import by.asushenya.total.bean.util.RatesPage;
import by.asushenya.total.service.exception.ServiceException;

public interface UserService {
	String registrationUser(String login, 
							String email, 
							String password) 
										  throws ServiceException;
	
	//List<Rate> getAllUserRates(User user) throws ServiceException;
	
	GamesPage getGamesPage(int page,
						   int recordsPerPage,
						   GameKind gameKind,
						   String local)
										  throws ServiceException;
	
	RatesPage getRatesPage(User user,
						   int page,
						   int recordsPerPage,
						   String local)
										  throws ServiceException;
							
	
	String makeRate(int gameId,
					User user,
					RateChoice choice,
					double rateCoefficient,
					double rateMoney)
										  throws ServiceException;
	
										
}
