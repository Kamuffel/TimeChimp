<?php
require_once(dirname(__FILE__) . '/class.database.php');
/**
 * 	Statistics
 */
class Statistics
{
	private $_page_num;

	function __construct() {
		$this->_MySQLi = new Database();
	}

	public function setPageNum($p_page_num) { $this->_page_num = $p_page_num; }

	public function request() {
		
	}
}
?>