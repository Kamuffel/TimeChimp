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
    
    // Tracker object holder
    $trackerObj = NULL;
    
    // tracker data
    if (isset($ajaxData['tracker_data'])) {
        $clock_time       = trim(strtolower($ajaxData['tracker_data']['txt_clock_time']));
        $clock_break_time = trim($ajaxData['tracker_data']['txt_clock_break_time']);
        $activity_description = trim($ajaxData['tracker_data']['txt_activity_description']);
        
        if (empty($clock_time))
            $return_messages[] = array();
        
        if (empty($clock_break_time))
            $return_messages[] = array();

        if (empty($activity_description))
            $return_messages[] = array();
        
        if (!empty($clock_time) && !empty($clock_break_time)) {
            $trackerObj = new Tracker();
            
            $trackerObj->setClockTime($clock_time);
            $trackerObj->setClockBreakTime($clock_break_time);
            $trackerObj->setActivityDescription($activity_description);

            $tracker_data = $trackerObj->update();

            if (count($tracker_data) > 0) {
                $return_messages[] = array(
                    'type' => 'complex',
                    'name' => 'tracker_update',
                    'data' => $tracker_data
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

     // tracker data
    if (isset($ajaxData['insert_data']))
    {
        $start_time = trim($ajaxData['insert_data']['start_time']);
        $stop_time  = trim($ajaxData['insert_data']['stop_time']);
        $break_time = trim($ajaxData['insert_data']['break_time']);
        $activity_description = trim($ajaxData['insert_data']['activity_description']);
        
        if (empty($start_time))
            $return_messages[] = array();
        
        if (empty($stop_time))
            $return_messages[] = array();

        if (empty($break_time))
            $return_messages[] = array();

        if (empty($activity_description))
            $return_messages[] = array();
        
        if (!empty($start_time) &&
            !empty($stop_time) &&
            !empty($break_time) &&
            !empty($activity_description)) {

            $trackerObj = new Tracker();
            
            $trackerObj->setStartTime($start_time);
            $trackerObj->setStopTime($stop_time);
            $trackerObj->setBreakTime($break_time);
            $trackerObj->setActivityDescription($activity_description);

            $tracker_data = $trackerObj->insert();

            if (count($tracker_data) > 0) {
                $return_messages[] = array(
                    'type' => 'complex',
                    'name' => 'tracker_update',
                    'data' => $tracker_data
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