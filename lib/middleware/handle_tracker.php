<?php
// check if XML_HTTP_REQUEST (safety)
if (isset($_SERVER['HTTP_X_REQUESTED_WITH']) && strtolower($_SERVER['HTTP_X_REQUESTED_WITH']) === 'xmlhttprequest' && count($_POST) > 0) {
    session_start();
    
    // include user class
    require_once (dirname(__FILE__) . '/../classes/class.tracker.php');
    
    // set post data
    $ajaxData = $_POST;
    
    // message holder
    $return_messages = array();
    
    // User object holder
    $userObj = NULL;
    
    // login
    if (isset($ajaxData['tracker_data'])) {
        $clock_time       = trim(strtolower($ajaxData['tracker_data']['txt_clock_time']));
        $clock_break_time = trim($ajaxData['tracker_data']['txt_clock_break_time']);
        
        if (empty($clock_time))
            $return_messages[] = array( );
        
        if (empty($clock_break_time))
            $return_messages[] = array();
        
        if (!empty($clock_time) && !empty($clock_break_time)) {
            $trackerObj = new Tracker();
            
            $trackerObj->setClockTime($clock_time);
            $trackerObj->setClockBreakTime($clock_break_time);

            if ($trackerObj->update()) {
                $return_messages[] = array(
                    'type' => 'complex',
                    'name' => 'tracker_update'
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