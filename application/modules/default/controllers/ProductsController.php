<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

class Default_ProductsController extends Zend_Controller_Action
{
    public function init()
    {
        $this->getHelper('ViewRenderer')->setNorender(1);
    }
    
    public function viewAction()
    {
        echo 'Hello product: ' . $this->getParam('ident');
    }
}
