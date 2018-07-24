<?php
require_once(dirname(__FILE__) . '/class.database.php');
/**
 * Class user
 */
class User
{
	private $_username;
	private $_password;
	private $_email;

	private $_hourly_wage;

	private $_MySQLi;

	function __construct() {
		$this->_MySQLi = new Database();
	}

	public function setUsername($p_username) { $this->_username = $p_username; }
	public function setPassword($p_password) { $this->_password = $p_password; }
	public function setEmail($p_email) { $this->_email = $p_email; }
	public function setHourlyWage($p_hourly_wage) { $this->_hourly_wage = $p_hourly_wage; }

	public function getUsername() { return $this->_username; }
	public function getHourlyWage() { return $this->_hourly_wage; }

	public function register() 
	{
		$this->_password = password_hash(hash('sha256', $this->_password), PASSWORD_DEFAULT);

		if($this->_MySQLi->putQuery("INSERT INTO `users` VALUES (NULL, '".$this->_username."', '".$this->_password."', '".$this->_email."', NULL)"))
		{
			$_SESSION['allowed'] = true;
			$_SESSION['username'] = $this->_username;
			$_SESSION['email'] = $this->_email;

			return true;
		}
		return false;
	}

	public function login()
	{
		$db_password = $this->_MySQLi->getQuery("SELECT *
											 	 FROM `users` AS h
											 	 WHERE `Username` = '". $this->_username ."'");

		if (!empty($db_password[0]['Password']))
		{
			// match hashed passwords
			if (password_verify(hash('sha256', $this->_password), $db_password[0]['Password']))
			{
				$_SESSION['allowed'] = true;
				$_SESSION['username'] = $db_password[0]['Username'];
				$_SESSION['email'] = $db_password[0]['Email'];

				return true;
			}
		}

		return false;
	}

	public function update() {
		return $this->_MySQLi->putQuery("UPDATE `users` SET `hourly_wage` = '". $this->_hourly_wage ."'");
	}
	
	public function getAllTrackerInfo() {
		return $this->_MySQLi->getQuery("SELECT * FROM `activity` WHERE `User_ID` = '1' ORDER BY `T_ID` DESC");
	}

	public function getTrackerInfo($page, $maxRecords){
		$startFrom = 0;

		if($page == 1) {
			$startFrom = 0;
		}
		else {
			$startFrom = (int)((int)$page - 1) * (int)$maxRecords;
		}
		
		return $this->_MySQLi->getQuery("SELECT * FROM `activity` WHERE `User_ID` = '1' ORDER BY `T_ID` DESC LIMIT $startFrom, $maxRecords");
	}

	public function getAmountRecords($tableName, $identifier)
	{
		return $this->_MySQLi->getAmountRows($tableName, $identifier);
	}
}
?>