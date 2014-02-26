<?php
class Default_ErrorController extends Zend_Controller_Action
{
    public function errorAction()
    {
        $errors = $this->getParam('error_handler');
        $this->view->message = $errors->exception->getMessage();
        $this->view->assign('params', print_r($this->getRequest()->getParams(), true));
    }
}