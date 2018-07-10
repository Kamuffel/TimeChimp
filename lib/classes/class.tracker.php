<?php
require_once(dirname(__FILE__) . '/class.database.php');
/**
 * Tracker class
 */
class Tracker
{
	private $_clock_time;
	private $_clock_break_time;
	private $_MySQLi;

	function __construct()
	{
		$this->_MySQLi = new Database();
	}

	public function setClockTime($p_clock_time) { $this->_clock_time = $p_clock_time; }
	public function setClockBreakTime($p_clock_break_time) { $this->_clock_break_time = $p_clock_break_time; }

	public function update() {
		
	}
}
?>