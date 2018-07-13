<?php
require_once(dirname(__FILE__) . '/class.database.php');
/**
 * Tracker class
 */
class Tracker
{
	private $_clock_time;
	private $_clock_break_time;
	private $_activity_description;

	private $_MySQLi;

	function __construct()
	{
		$this->_MySQLi = new Database();
	}

	public function setClockTime($p_clock_time) { $this->_clock_time = $p_clock_time; }
	public function setClockBreakTime($p_clock_break_time) { $this->_clock_break_time = $p_clock_break_time; }
	public function setActivityDescription($p_activity_description) { $this->_activity_description = $p_activity_description; }

	private function str_to_seconds($duration) {
		list($h, $m, $s) = explode(':', $duration);
		return $s + ($m * 60) + ($h * 3600);
	}

	private function seconds_to_str($seconds) {
	    return sprintf('%02d:%02d:%02d', $seconds / 3600, $seconds / 60 % 60, $seconds % 60);
	}

	public function update() {
		$end_time = date('H:i:s', time());
		 
		$start_time = $this->seconds_to_str($this->str_to_seconds($end_time) - ($this->str_to_seconds($this->_clock_time) + $this->str_to_seconds($this->_clock_break_time)));

		if ($this->_MySQLi->putQuery('INSERT INTO `activity` VALUES
										 (NULL, "1", "'.$start_time.'", "'.$end_time.'", "'.$this->_clock_time.'", "'.$this->_clock_break_time.'", CURDATE(), "'.$this->_activity_description.'")'))
		{
			$lID = $this->_MySQLi->getLastID();
			$min = ($lID >= 2) ? $lID - 3 : $lID;
	
			return $this->_MySQLi->getQuery("SELECT *
											 FROM `activity`
											 WHERE `T_ID` = '". $lID ."'
											 OR `T_ID` <= '". $lID ."'
											 LIMIT $min, $lID");
		}

		return array();
	}
}
?>