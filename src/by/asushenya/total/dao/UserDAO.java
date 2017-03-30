package by.asushenya.total.dao;

import java.util.List;
import java.util.Locale;

import by.asushenya.total.bean.Game;
import by.asushenya.total.bean.Rate;
import by.asushenya.total.bean.Team;
import by.asushenya.total.bean.User;
import by.asushenya.total.bean.util.GameKind;
import by.asushenya.total.dao.exception.DAOException;

public interface UserDAO {
	void registeredNewUser(User user) throws DAOException;

	User findUserByLogin(String login) throws DAOException;

	User findUserByEmail(String email) throws DAOException;

	List<Rate> getAllUserRates(User user) throws DAOException;

	List<Game> getGamesByType(GameKind game_type) throws DAOException;

	boolean makeRate(Rate rate) throws DAOException;

	List<Game> getGamesForPage(int offset, int noOfRecords, GameKind gameKind, String local) throws DAOException;

	int getGamesRecordsByGameKindCount(GameKind gameKind) throws DAOException;

	List<Team> getTeamsByGameKind(GameKind gameKind, String local) throws DAOException;

	List<Rate> getRatesForPage(User user, int page, int ratesPerPage, String local) throws DAOException;

	int getRatesRecordsCountOfUser(User user) throws DAOException;

}
