package user.bo;

import model.User;
import user.dao.UserDAO;
import util.DefineUtil;
import util.StringUtil;

public class UserBO {
	private UserDAO userDAO;

	public int login(String username, String password) {
		userDAO = new UserDAO();
		password = StringUtil.md5(password);
		User user = userDAO.checkDuplicate(username, password);
		if (user.getStatus() == DefineUtil.LOGGED) {
			return DefineUtil.LOGGED;
		} else {
			userDAO.login(username, password);
			return DefineUtil.UNLOGGED;
		}
	}

	public int register(String username, String password) {
		userDAO = new UserDAO();
		User user = userDAO.checkDuplicate(username, password);
		if (user != null) {
			return DefineUtil.DUPLICATED;
		} else {
			password = StringUtil.md5(password);
			User newUser = new User(username, password, 0);
			if (userDAO.register(newUser) >= DefineUtil.SUCCESS) {
				return DefineUtil.SUCCESS;
			} else {
				return DefineUtil.ERROR;
			}
		}
	}

	public void logout(String username) {
		userDAO = new UserDAO();
		userDAO.logout(username);
	}
}
