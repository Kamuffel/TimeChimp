<?php
require_once(dirname(__FILE__) . '/class.database.php');
/**
 * Class user
 */
class User
{
	private $_username;
	private $_password;
	private $_MySQLi;

	function __construct() {
		$this->_MySQLi = new Database();
	}

	public function setUsername($p_username) { $this->_username = $p_username; }
	public function setPassword($p_password) { $this->_password = $p_password; }

	public function getUsername() { return $this->_username; }
	public function getPassword() { return $this->_password; }

	public function login() {
		$user_data = $this->_MySQLi->getQuery("SELECT *
											   FROM `users`
											   WHERE `Username` = '". $this->_username ."'
											   AND `Password` = '". $this->_password ."'");
		if (is_array($user_data))
			return (count($user_data) == 1);
	}
}
?>