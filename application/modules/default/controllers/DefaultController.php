<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

class Default_DefaultController extends Zend_Controller_Action
{
    public function init()
    {
        
    }
    
    public function defaultAction()
    {
        $this->getHelper('ViewRenderer')->setNorender(1);
        print_r($this->getRequest()->getParams());
        echo 'Hello Default';
    }

    public function indexAction()
    {
        $this->view->placeholder('foo')->append('Hello World!');
//        $this->_forward('foo');
        $this->_helper->redirector->gotoSimple('foo', 'default', 'default', array());
        echo '123';
        die;
//        $arr = array();
//        $arr->append(100);
//        print_r($arr);
//        die;
    }

    public function fooAction()
    {
    }
}
