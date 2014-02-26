<?php

class Bootstrap extends Zend_Application_Bootstrap_Bootstrap
{

    public function _initPluginLoader() 
    {
//        if ($this->getOption('enablePluginCacheLoader') !== false) {
//            $cacheFile = APPLICATION_PATH . '/../data/PluginLoaderCache.php';
//            $this->getPluginLoader()->setIncludeFileCache($cacheFile);
//        }
    }
    
    public function _initPlugins()
    {
        $loader = new Zend_Application_Module_Autoloader(
            array (
                'namespace' => '',
                'basePath' => APPLICATION_PATH,
            )
        );

    }
    
    public function _initRoute()
    {
    }
}

