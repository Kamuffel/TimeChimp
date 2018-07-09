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
    if (isset($ajaxData['user_login_data'])) {
        $username = trim(strtolower($ajaxData['user_login_data']['txt_login_username']));
        $password = trim($ajaxData['user_login_data']['txt_login_password']);
        
        if (empty($username))
            $return_messages[] = array(
                'type' => 'simple',
                'field' => 'lbl_login_username',
                'text' => '(veld is leeg)'
            );
        
        if (empty($password))
            $return_messages[] = array(
                'type' => 'simple',
                'field' => 'lbl_login_password',
                'text' => '(veld is leeg)'
            );
        
        if (!empty($username) && ! empty($password)) {
            $userObj = new User();
            
            $userObj->setUsername($username);
            $userObj->setPassword($password);

            if ($userObj->login()) {
                $return_messages[] = array(
                    'type' => 'complex',
                    'name' => 'user_redirect',
                    'action' => './tool.php'
                );
            } else {
                $return_messages[] = array(
                    'type' => 'simple',
                    'field' => 'generic_error',
                    'text' => 'One of your credentials is invalid',
                );
            }
        }
        sleep(1.5);
    }
          
    // if messages detected -> output to front-end
    if (count($return_messages) > 0)
        echo json_encode($return_messages);
    
    exit();
}
?> 