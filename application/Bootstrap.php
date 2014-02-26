<?php

class Bootstrap extends Zend_Application_Bootstrap_Bootstrap
{

    public function _initPluginLoader() 
    {
        if ($this->getOption('enablePluginCacheLoader') !== false) {
            $cacheFile = APPLICATION_PATH . '/../data/PluginLoaderCache.php';
            $this->getPluginLoader()->setIncludeFileCache($cacheFile);
        }
    }
    
    public function _initPlugins()
    {
        $loader = new Zend_Application_Module_Autoloader(
            array (
                'namespace' => '',
                'basePath' => APPLICATION_PATH,
            )
        );
        
//        $loader->addResourceType('ShopPlugin', 'plugins', 'ShopPlugin');
    }
    
    public function _initRoute()
    {
        return; 
        $this->bootstrap('frontcontroller');
        $front = $this->getResource('frontcontroller');
        $router = $front->getRouter();
        
        $route = new Zend_Controller_Router_Route(
            'product/:ident', 
            array(
                'module' => 'default',
                'controller' => 'products',
                'action' => 'view',
                )
        );
        $router->addRoute('product', $route);
    }
}

