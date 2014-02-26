<?php
class Default_MailController extends Zend_Controller_Action
{
    public function init()
    {
        
    }

    public function indexAction() {
        $flMsg = $this->getHelper('FlashMessenger');
        $this->view->msg = '';
        if ($flMsg->hasMessages()) {
            $this->view->msg = current($flMsg->getMessages());
        }
    }

    public function testViewAction()
    {
        $en = array(
                'm1' => 'message1',
                'm2' => 'message2',
                'm3' => 'message3',
            );
        $vi = array(
                'm1' => 'tin nhan 1',
                'm2' => 'tin nhan 1',
                'm3' => 'tin nhan 1',
            );
        $ge = array(
                'm1' => 'germen1',
                'm2' => 'germen2',
                'm3' => 'germen3',
            );


        $this->view->trans = new Zend_Translate('Array', $en, 'en');
        $this->view->trans->addTranslation($vi, 'vi');
        $this->view->trans->addTranslation(
            array('content' => $ge, 'locale' => 'ge')
        );
    }

    public function testQtAction()
    {
        $trans = new Zend_Translate(
            array(
                'adapter' => 'Qt',
                'content' => APPLICATION_PATH . '/languages/en.ts',
                'locale' => 'en',
            )
        );


        $trans->addTranslation(
            array(
                'content' => APPLICATION_PATH . '/languages/vi.ts',
                'locale' => 'vi',
            )
        );

        $trans->setLocale('vi');
        
        $this->view->trans = $trans;
    }

    public function testGettextAction()
    {
        $trans = new Zend_Translate(
            array(
                'adapter' => 'gettext',
                'content' => APPLICATION_PATH . '/languages/vi_VI.mo',
                'locale' => 'vi',
            )
        );

//        echo realpath(APPLICATION_PATH . '/languages/en_US.mo');
//        die;


        $trans->addTranslation(
            array(
                'content' => APPLICATION_PATH . '/languages/en_US.mo',
                'locale' => 'en',
            )
        );

        $trans->setLocale('en');

        $this->view->trans = $trans;
    }

    public function sendMailAction()
    {
        $this->getHelper('ViewRenderer')->setNorender(true);

        $mail = new Zend_Mail('UTF-8');
        $mail->setFrom('khoimt@sample.local.com', 'KhoiMT1');
        $mail->addCc('khoimt@sample.local.com', 'khoimt');
        $mail->addCc(array('mtk' => 'mtk@sample.local.com', 'mtk2' => 'mtk2@sample.local.com'));
        $mail->setReplyTo('reply@sample.local.com', 'KhoiMT2');
        $mail->addTo('khoimt1@fsoft.com.vn');
        $mail->setSubject('test send mail');
        $mail->setBodyText('test send mail');

        ini_set('display_erros', 1);
        error_reporting(E_ALL);
        $tran = new Zend_Mail_Transport_File(
            array('callback'
                => create_function('$tran', 'return $tran->recipients = date("His") . ".tmp";')
            )
        );

        $mail->setDefaultTransport($tran);

        try {
            $mail->send();
            $this->getHelper('FlashMessenger')->addMessage('Success');
        } catch (Exception $ex) {
            $this->getHelper('FlashMessenger')->addMessage('Fail');
        }

        $this->_helper->redirector->gotoSimple('index');
    }
}