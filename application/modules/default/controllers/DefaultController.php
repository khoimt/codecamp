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
       $this->getHelper('ViewRenderer')->setNorender(1);
       echo 'Hello World!';
       echo 123;
       die;
    }

    public function fooAction()
    {
    }
}
