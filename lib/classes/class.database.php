<?php
/**
 * @name Database
 */
class Database
{
    private $_host     = 'localhost';
    private $_user     = 'root';
    private $_password = '';
    private $_db       = 'thomang3_TimeChimp';

    private $_dbc;

    /**
      * Database constructor
      *
      * @param void
      *
      * @return void
      */
    public function __construct()
    {
        $this->_dbc = mysqli_connect($this->_host, $this->_user, $this->_password, $this->_db);
    }

    /**
      * Retrieve last inserted id (auto increment database)
      *
      * @param void
      *
      * @return int (auto increment id)
      */
    public function getLastID()
    {
        return $this->_dbc->insert_id;
    }

    /**
      * Prevent SQL-injections and XSS
      *
      * @param string $string string to be cleaned
      *
      * @return string (clean string)
      */
    public function cleanString($string)
    {
        return mysqli_real_escape_string($this->_dbc, strip_tags($string));
    }

    /**
      * Function for update/insert/replace queries
      *
      * @param string $queryString sql string
      *
      * @return bool (action true | false)
      */
    public function putQuery($queryString)
    {
        return $this->_dbc->query($queryString);
    }

    /**
      * Function for select
      *
      * @param string $queryString sql string
      *
      * @return array (query results)
      */
    public function getQuery($queryString)
    {
        $result = $this->_dbc->query($queryString);

        if ($result) {

            $queryResults = array();

            while ($res = $result->fetch_assoc()) {
                $queryResults[] = $res;
            }
            
            return $queryResults;
        }

        return null;
    }
    public function getAmountRows($tableName, $identifier){
      $result = $this->_dbc->query("SELECT COUNT($identifier)FROM $tableName");
      if ($result) {
        $row = mysqli_fetch_row($result);
        $total_records = $row[0]; 
        return $total_records;
      }
      return null;
    }
}
?>