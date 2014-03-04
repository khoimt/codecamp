<?php

class Storefront_Form_Problem_Submit extends SF_Form_Abstract
{

	public function init()
	{
		$this->addElement('file', 'submits', array(
			'required' => false,
			'ignore' => true,
			'label' => 'Files',
		));
		
		$this->addElement('submit', 'submit', array(
			'required' => false,
			'ignore' => true,
			'label' => 'Submit',
		));
		$this->setDecorators(array(
			'FormElements',
			array('HtmlTag', array('tag' => 'dl', 'class' => 'zend_form')),
			array('Description', array('placement' => 'prepend', 'class' => 'error')),
			'Form'
		));
	}
}