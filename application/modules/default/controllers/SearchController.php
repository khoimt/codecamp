<?php
class Default_SearchController extends Zend_Controller_Action
{
    protected $_indexDir = '';
    public function init()
    {
        $this->_indexDir = realpath(DATA_DIR . '/my-index');
        Zend_Search_Lucene_Analysis_Analyzer::setDefault(
            new Zend_Search_Lucene_Analysis_Analyzer_Common_Utf8());
        Zend_Search_Lucene_Search_QueryParser::setDefaultEncoding('utf-8');
    }
    
    public function indexAction()
    {
        $doc = new Zend_Search_Lucene_Document();
        $doc->addField(Zend_Search_Lucene_Field::Keyword('doctype', 'autogenerated'));
        $doc->addField(Zend_Search_Lucene_Field::UnIndexed('created',time()));

//        echo $doc;
        die;
    }

    public function testAction()
    {
        print_r(glob(DEMO_DIR . '/Zend/Search/Lucene/indexing/IndexSource/*.html'));
        die;
    }

    public function createIndexAction()
    {
        $index = Zend_Search_Lucene::create(
                $this->_indexDir);

        $index->setMaxbufferedDocs(5);

        foreach (glob(DEMO_DIR . '/Zend/Search/Lucene/indexing/IndexSource/*.html')
                as $file) {
            if (!file_exists($file)) {
                continue;
            }
            $doc = Zend_Search_Lucene_Document_Html::loadHTMLFile($file);
            $doc->addField(Zend_Search_Lucene_Field::text('name', basename($file)));
            $doc->addField(Zend_Search_Lucene_Field::text('content', $doc->getHtmlBody(), 'UTF-8'));
            $doc->addField(Zend_Search_Lucene_Field::unIndexed('path', $file));
            $doc->addField(Zend_Search_Lucene_Field::keyword('modified', filemtime($file)));

            $index->addDocument($doc);
        }
        
        echo 'Number of document: ';
        echo $index->count();
        echo PHP_EOL;
        echo 'Done';
        die;
    }

    public function queryAction()
    {
        $str_Query = 'auth?r?';
        Zend_Search_Lucene::setResultSetLimit(3);

        $index = Zend_Search_Lucene::open($this->_indexDir);

        $query = Zend_Search_Lucene_Search_QueryParser::parse($str_Query);

//        echo get_class($query);
//        echo PHP_EOL;
//        echo $query;die;

        $term1 = new Zend_Search_Lucene_Index_Term('world1');
        $term2 = new Zend_Search_Lucene_Index_Term('world2');
        $term3 = new Zend_Search_Lucene_Index_Term('world3');

        $query = new Zend_Search_Lucene_Search_Query_Phrase();
        $query->addTerm($term1);
        $query->addTerm($term2);
        $query->addTerm($term3, 3);

        $query = new Zend_Search_Lucene_Search_Query_Phrase(
                 array('word1', 'word2', 'word3'), array(0,3,2), 'test');
        echo $query;die;

        $terms = new Zend_Search_Lucene_Index_Term(array('x' => 'y', 'c' => 'd'));
        $query = new Zend_Search_Lucene_Search_Query_Term($terms);

        $query = new Zend_Search_Lucene_Search_Query_MultiTerm();
        $query->addTerm(new Zend_Search_Lucene_Index_Term('a', 'b'));
        $query->addTerm(new Zend_Search_Lucene_Index_Term('c', 'b'));
        echo $query->__toString();die;
//        echo get_class($query);
//        die;
        $hit = $index->find($query);

        if (empty($hit)) {
            die;
        }

        $counter = 1;
        foreach ($hit as $item) {
            echo "id: " . $item->id; echo PHP_EOL;
            echo "item: " . $counter++; echo PHP_EOL;
            echo 'score : ' . $item->score; echo PHP_EOL;
            foreach (($item->getDocument()->getFieldNames() + array('id', 'score')) as $field) {
                if ($field == 'content') continue;
                echo "$field : " . $item->{$field} . PHP_EOL;
            }
        }
        die;
    }

    public function optimizeAction()
    {
        $index = Zend_Search_Lucene::open($this->_indexDir);
        $index->optimize();
        echo 'Done';
        die;
    }

    public function retryIndexAction()
    {
        $index = Zend_Search_Lucene::open(
                $this->_indexDir);

        echo 'Number of document: ';
        echo $index->count();
        echo PHP_EOL;
        echo $index->numDocs();
        echo PHP_EOL;
        echo $index->maxDoc(); 
        die;
    }
}