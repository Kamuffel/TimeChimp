<?php
// check if XML_HTTP_REQUEST (safety)
if (isset($_SERVER['HTTP_X_REQUESTED_WITH']) && strtolower($_SERVER['HTTP_X_REQUESTED_WITH']) === 'xmlhttprequest' && count($_POST) > 0) {
    session_start();
    
    // include user class
    require_once (dirname(__FILE__) . '/../classes/class.statistics.php');
    
    // set post data
    $ajaxData = $_POST;
    
    // message holder
    $return_messages = array();
    
    // page object holder
    $statsObj = NULL;
    
    // page data
    if (isset($ajaxData['statistics_data'])) {
        $page_num = trim(strtolower($ajaxData['statistics_data']['page_num']));
        
        if (empty($page_num))
            $return_messages[] = array();
        
        if (!empty($page_num)) {
            $statsObj = new Statistics();
            $statsObj->setPageNum($page_num);
            $stats_data = $statsObj->request();

            if (count($stats_data) > 0) {
                $return_messages[] = array(
                    'type' => 'complex',
                    'name' => 'page_update',
                    'data' => $stats_data
                );
            } else {
                $return_messages[] = array(
                    'type'  => 'simple',
                    'field' => 'generic_error',
                    'text'  => 'something went wrong!?',
                );
            }
        }
    }

    // if messages detected -> output to front-end
    if (count($return_messages) > 0)
        echo json_encode($return_messages);
    
    exit();
}
?> 