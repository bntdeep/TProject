package by.asushenya.total.service.impl;

import java.sql.Timestamp;
import java.util.List;

import org.apache.log4j.Logger;
import org.json.simple.JSONObject;

import by.asushenya.total.bean.Game;
import by.asushenya.total.bean.Team;
import by.asushenya.total.bean.User;
import by.asushenya.total.bean.util.GameKind;
import by.asushenya.total.bean.util.UsersPage;
import by.asushenya.total.controller.RequestParameterName;
import by.asushenya.total.controller.ResponseParameterName;
import by.asushenya.total.dao.AdminDAO;
import by.asushenya.total.dao.UserDAO;
import by.asushenya.total.dao.exception.DAOException;
import by.asushenya.total.dao.factory.DAOFactory;
import by.asushenya.total.service.AdminService;
import by.asushenya.total.service.exception.ServiceException;

public class AdminServiceImpl implements AdminService {

	private static final Logger log = Logger.getLogger(AdminServiceImpl.class);

	@Override
	public UsersPage getUsersPage(int page, int usersPerPage) throws ServiceException {

		int noOfRecords = 0;

		List<User> usersList = null;

		DAOFactory daoFactory = DAOFactory.getInstance();
		AdminDAO adminDAO = daoFactory.getAdminDAO();

		try {
			usersList = adminDAO.getUsersForPage((page - 1) * usersPerPage, usersPerPage);

			noOfRecords = adminDAO.getUsersRecordsCount();
		} catch (DAOException e) {
			log.error("can't get games page form dao", e);
			throw new ServiceException("Can't get games from dao", e);
		}

		int noOfPages = (int) Math.ceil(noOfRecords * 1.0 / usersPerPage);

		UsersPage usersPage = new UsersPage();
		usersPage.setUsersList(usersList);
		usersPage.setNumberOfPages(noOfPages);

		return usersPage;
	}

	public List<Team> getTeamsByGameKind(GameKind gameKind, String local) throws ServiceException {
		DAOFactory daoFactory = DAOFactory.getInstance();
		UserDAO userDAO = daoFactory.getUserDAO();
		List<Team> listOfTeams = null;

		try {
			listOfTeams = userDAO.getTeamsByGameKind(gameKind, local);

		} catch (DAOException e) {
			log.error("can't get list of teams", e);
			throw new ServiceException("can't get list of teams", e);
		}

		return listOfTeams;
	}

	public String addNewGame(GameKind gameKind, String firstTeamName, String secondTeamName, Timestamp gameDate,
			double k1, double kx, double k2, String local) throws ServiceException {
		Game newGame = new Game();
		newGame.setGameKind(gameKind);
		newGame.setFirstTeam(firstTeamName);
		newGame.setSecondTeam(secondTeamName);
		newGame.setDate(gameDate);
		newGame.setK1(k1);
		newGame.setKx(kx);
		newGame.setK2(k2);

		if (local == null) {
			local = RequestParameterName.SESSION_LOCAL_RU;
		}

		DAOFactory daoFactory = DAOFactory.getInstance();
		AdminDAO adminDAO = daoFactory.getAdminDAO();

		try {
			adminDAO.addGame(newGame, local);
		} catch (DAOException e) {
			log.error("can't add new game", e);
			throw new ServiceException("can't add new game", e);
		}

		JSONObject json = new JSONObject();
		json.put(ResponseParameterName.SUCCESS, ResponseParameterName.OK);

		return json.toString();
	}

}
