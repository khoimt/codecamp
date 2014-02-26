<?php
class Plugin_Foo extends Zend_Controller_Plugin_Abstract 
{
    public function preDispatch(\Zend_Controller_Request_Abstract $request) 
    {
        echo "foo pre dispatch plugin<br />";
        echo PHP_EOL;
    }
    
    public function postDispatch(\Zend_Controller_Request_Abstract $request) 
    {
        echo "foo post dispatch plugin<br />";
        echo PHP_EOL;
    }
}