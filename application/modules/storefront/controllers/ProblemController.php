<?php

class Storefront_ProblemController extends Zend_Controller_Action {

    /**
     *
     * @var Storefront_Model_User 
     */
    protected $_model;

    /**
     *
     * @var Storefront_Service_Authentication 
     */
    protected $_authService = null;
    
    public function init() {
        // get the default model
        $this->_model = new Storefront_Model_User();

        $this->_authService = Storefront_Service_Authentication::getInstance(
                        $this->_model
        );
    }
    
    public function preDispatch() {
        if ($this->_authService->getIdentity() === false) {
            return $this->_helper->redirector('login', 'user');
        }
    }

    public function indexAction() {

    }

    public function submitAction() {
        
    }
}
