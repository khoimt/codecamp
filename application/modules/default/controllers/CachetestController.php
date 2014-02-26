<?php
class Default_CachetestController extends Zend_Controller_Action
{

    public function init()
    {
        $bootstrap = $this->getInvokeArg('bootstrap');
        $cacheMng = $bootstrap->getResource('cachemanager');
        $this->_cache = $cacheMng->getCache('default');
        $this->_cacheFunc = $cacheMng->getCache('function');
        $this->_cacheMem = $cacheMng->getCache('memcached');
    }

    
    public function indexAction()
    {
        $cache = $this->_cache;
        if (!$cache->start('sample')) {
            echo "now is : " . time();
            echo PHP_EOL;
            $cache->end(array('foo'));
        }
        echo "now is : " . time();
        die;
    }

    public function testCacheFuncAction()
    {
//        print_r($this->_cacheFunc);
        $cache = $this->_cacheFunc;
        $cache->call('sayHello', array());
        die;
    }

    public function testMemAction()
    {
        $this->_cacheMem->clean(Zend_Cache::CLEANING_MODE_MATCHING_TAG, array('foo'));
        $this->_cacheMem->remove('time');
        if (!($time = $this->_cacheMem->load('time'))) {
            $time = time();
            $this->_cacheMem->save(time(), 'time', array('foo'), 100);
        }

        echo 'Now is: ' . time();
        echo PHP_EOL;
        echo 'Time in memcache is: ' . $time;
        die;
    }
}