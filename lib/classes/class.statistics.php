<?php
require_once(dirname(__FILE__) . '/class.database.php');
/**
 * 	Statistics
 */
class Statistics
{
	private $_page_num;
	private $_max_records = 10;

	function __construct() {
		$this->_MySQLi = new Database();
	}

	public function setPageNum($p_page_num) { $this->_page_num = $p_page_num; }

	public function getTrackerInfo($page, $maxRecords){
		$startFrom = 0;

		if($page <= 1) $startFrom = 0;
		else $startFrom = (int)((int)$page - 1) * (int)$maxRecords;
		
		return $this->_MySQLi->getQuery("SELECT * FROM `activity` WHERE `User_ID` = '1' ORDER BY `T_ID` DESC LIMIT $startFrom, $maxRecords");
	}

	public function removeRecord($t_id){
		return $this->_MySQLi->putQuery("DELETE FROM `activity` WHERE `T_ID` = $t_id");
	}

	public function getAmountRecords($tableName, $identifier)
	{
		return $this->_MySQLi->getAmountRows($tableName, $identifier);
	}

	public function request()
	{
		if($this->_page_num <= 0)
			$this->_page_num = 1;

		$maxRecords = 10;
		$totalPages = ceil($this->getAmountRecords('activity','T_ID') / $this->_max_records);
		
		return array('current_page' => $this->_page_num, 'page_data' => $this->getTrackerInfo($this->_page_num, 10),
					 'total_pages' => $totalPages);
	}
}
?>