<?php

class Form_Login extends Zend_Form 
{
    public function init()
    {
        $this->addElement('text', 'username')
            ->setDescription('accout id or email');
        
        $this->addElement('password', 'password')
            ->setDescription('password to login');
        
        $this->addElement('submit', 'submit');
        
        $this->addElement('reset', 'reset');
    }
}