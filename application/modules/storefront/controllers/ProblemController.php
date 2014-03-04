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
        $this->view->problemSubmit = $this->getSubmitForm();
    }
    
    public function getSubmitForm() {
        $name = "problemSubmit";
        $urlHelper = $this->_helper->getHelper('url');
        if (array_key_exists($name, $this->_forms)) {
            return $this->_forms[$name];
        }
        
        $this->_forms[$name] = $this->_model->getForm($name);
        $this->_forms[$name]->setAction($urlHelper->url(array(
                    'controller' => 'problem',
                    'action' => 'save'
                        ), 'default'
        ));
        $this->_forms[$name]->setMethod('post');
        $this->_forms[$name]->setEnctype(Zend_Form::ENCTYPE_MULTIPART);
        return $this->_forms[$name];
    }
}
