package by.asushenya.total.dao.sql_query;

public class UserQuery {
	public static final String FIND_USER_BY_EMAIL = "select id, login,email, password , role, cash from user where email = ?";
	public static final String FIND_USER_BY_LOGIN = "select id, login,email, password , role, cash,is_visible from user where login = ?";
	public static final String INSERT_INTO_USER = "insert into user ( login, password,email,role,cash) values(?,?,?,?,?);";
	public static final String INSERT_INTO_RATE = "insert into rate (user_id, game_id, money, choice, game_coefficient) values(?,?,?,?,?)";
	public static final String GET_GAMES_BY_GAME_KIND_RU = "select id, game_kind, date, (select team.name from team  where team.id = game.team_1) as `team_1`, (select team.name from team where team.id = game.team_2) as `team_2`, k1, kx, k2 from game where is_visible = true and game_kind = ? limit ?,?";
	public static final String GET_GAMES_BY_GAME_KIND_EN = "select id, game_kind, date, (select team.name_en from team  where team.id = game.team_1) as `team_1`, (select team.name_en from team where team.id = game.team_2) as `team_2`, k1, kx, k2 from game where is_visible = true and game_kind = ? limit ?,?";
	public static final String GET_ALL_GAMES_FOR_PAGE_RU = "select id, game_kind, date, (select team.name from team  where team.id = game.team_1) as `team_1`, (select team.name from team where team.id = game.team_2) as `team_2`, k1, kx, k2 from game where is_visible = true limit ?,?";
	public static final String GET_ALL_GAMES_FOR_PAGE_EN = "select id, game_kind, date, (select team.name_en from team  where team.id = game.team_1) as `team_1`, (select team.name_en from team where team.id = game.team_2) as `team_2`, k1, kx, k2 from game where is_visible = true limit ?,?";// game_rate
	public static final String getAllGamesByGameKindCount = "select count(*) `games_count` from game where is_visible = true and game_kind = ?";
	public static final String getAllGamesCount = "select count(*) `games_count` from game where is_visible = true";
}
