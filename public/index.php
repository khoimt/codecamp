<?php

function print_backtrace () {
    $arr = debug_backtrace();
    foreach ($arr as &$v) {
        unset($v['args']);
        unset($v['object']);
    }
    print_r(array_reverse($arr));
}

//function sayHello () {
//    echo "Hello aaa";
//    return '1';
//}

// Define path to application directory
defined('APPLICATION_PATH')
    || define('APPLICATION_PATH', realpath(dirname(__FILE__) . '/../application'));

defined('DATA_DIR')
    || define('DATA_DIR', realpath(dirname(__FILE__) . '/../data'));

defined('DEMO_DIR')
    || define('DEMO_DIR', realpath(dirname(__FILE__) . '/../demos'));

defined('CACHE_DIR')
    || define('CACHE_DIR', realpath(DATA_DIR . '/caches'));

// Define application environment
defined('APPLICATION_ENV')
    || define('APPLICATION_ENV', (getenv('APPLICATION_ENV') ? getenv('APPLICATION_ENV') : 'production'));

// Ensure library/ is on include_path
set_include_path(implode(PATH_SEPARATOR, array(
    realpath(APPLICATION_PATH . '/../library'),
    get_include_path(),
)));

/** Zend_Application */
require_once 'Zend/Application.php';

// Create application, bootstrap, and run
$application = new Zend_Application(
    APPLICATION_ENV,
    APPLICATION_PATH . '/configs/application.ini'
);
$application->bootstrap()
            ->run();
