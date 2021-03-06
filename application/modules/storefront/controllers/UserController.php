<?php

class Storefront_UserController extends Zend_Controller_Action {

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

        // add forms
        $this->view
                ->registerForm = $this->getRegistrationForm();
        $this->view
                ->loginForm = $this->getLoginForm();
        $this->view
                ->userForm = $this->getUserForm();
    }

    public function indexAction() {
        if ($this->_authService->getIdentity() === false) {
            return $this->_helper->redirector('login', 'user');
        }

        $this->view->user = $this->_model->getUserById($this->_authService->getIdentity()->userId);

        if (null === $this->view->user) {
            throw new SF_Exception('Unknown user');
        }

        $this->view->userForm = $this->getUserForm()->populate($this->view->user->toArray());
    }

    public function saveAction() {
        $request = $this->getRequest();
        if (!$request->isPost()) {
            return $this->_helper->redirector('index');
        }
        if (false === $this->_model->saveUser(
                        $request->getPost())) {
            return $this->render('index');
        }
    }

    public function loginAction() {
        
    }

    public function logoutHttpAction() {
        
    }

    public function authenticateAction() {
        $request = $this->getRequest();

        if (!$request->isPost()) {
            return $this->_helper->redirector('login');
        }

        // Validate
        $form = $this->_forms['login'];
        if (!$form->isValid($request->getPost())) {
            return $this->render('login');
        }

        if (false === $this->_authService->authenticate($form->getValues())) {
            $form->setDescription('Login failed, please try again.');
            return $this->render('login');
        }

        return $this->_helper->redirector('index', 'problem');
    }

    public function logoutAction() {
        $this->_authService->clear();
        return $this->_helper->redirector('index');
    }

    public function registerAction() {
        
    }

    public function completeRegistrationAction() {
        $request = $this->getRequest();
        if (!$request->isPost()) {
            return $this->_helper->redirector('register');
        }
        if (false === ($id = $this->_model
                ->registerUser($request->getPost()))
        ) {
            return $this->render('register');
        }
    }

    public function getRegistrationForm() {
        $urlHelper = $this->_helper->getHelper('url');
        $this->_forms['register'] = $this->_model->getForm
                ('userRegister');
        $this->_forms['register']->setAction($urlHelper->url(array(
                    'controller' => 'user',
                    'action' => 'complete-registration'
                        ), 'default'
        ));
        $this->_forms['register']->setMethod('post');
        return $this->_forms['register'];
    }

    public function getUserForm() {
        $urlHelper = $this->_helper->getHelper('url');
        $this->_forms['userEdit'] = $this->_model->getForm
                ('userEdit');
        $this->_forms['userEdit']->setAction($urlHelper->url(array(
                    'controller' => 'user',
                    'action' => 'save'
                        ), 'default'
        ));
        $this->_forms['userEdit']->setMethod('post');
        return $this->_forms['userEdit'];
    }

    public function getLoginForm() {
        $urlHelper = $this->_helper->getHelper('url');

        $this->_forms['login'] = $this->_model->getForm('userLogin');
        $this->_forms['login']->setAction($urlHelper->url(array(
                    'controller' => 'user',
                    'action' => 'authenticate',
                        ), 'default'
        ));
        $this->_forms['login']->setMethod('post');

        return $this->_forms['login'];
    }

}
