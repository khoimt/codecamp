<?php

class User_LoginController extends Zend_Controller_Action
{
    public function indexAction()
    {
        $this->view->assign('form', new Form_Login());
    }
}