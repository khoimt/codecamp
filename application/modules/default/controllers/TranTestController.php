<?php
class Default_TranTestController extends Zend_Controller_Action
{
    public function dateAction()
    {
        $date = new Zend_Date(strtotime('-7 hours'), null, 'fr');
        echo $date;
        die;
    }

    public function tranAction()
    {

    }
}