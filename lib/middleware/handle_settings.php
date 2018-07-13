<?php
// check if XML_HTTP_REQUEST (safety)
if (isset($_SERVER['HTTP_X_REQUESTED_WITH']) && strtolower($_SERVER['HTTP_X_REQUESTED_WITH']) === 'xmlhttprequest' && count($_POST) > 0) {
    session_start();
    
    // include user class
    require_once (dirname(__FILE__) . '/../classes/class.user.php');
    
    // set post data
    $ajaxData = $_POST;
    
    // message holder
    $return_messages = array();
    
    // User object holder
    $userObj = NULL;
    
    // login
    if (isset($ajaxData['profile_data'])) {
        $hourly_wage = trim(strtolower($ajaxData['profile_data']['txt_hourly_wage']));
        
        if (empty($hourly_wage))
            $return_messages[] = array();

        if (!is_numeric($hourly_wage))
            $return_messages[] = array();
        
        if (count($return_messages) == 0) {
            $userObj = new User();
            
            $userObj->setHourlyWage($hourly_wage);

            if ($userObj->update()) {
                $return_messages[] = array(
                    'type' => 'complex',
                    'name' => 'profile_update',
                    'data' => 'Good'
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