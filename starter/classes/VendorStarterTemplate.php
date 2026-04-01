<?php defined('BX_DOL') or die('hack attempt');
bx_import('BxDolModuleTemplate');
class VendorStarterTemplate extends BxDolModuleTemplate
{
    public function __construct(&$oConfig, &$oDb)
    {
        parent::__construct($oConfig, $oDb);
    }
    public function displayEntries($aEntries)
    {
        $sOut = '';
        foreach ($aEntries as $aEntry) {
            $sOut .= $this->parseHtmlByName('entry_item.html', array(
                'id'    => (int)$aEntry['id'],
                'title' => bx_html_attribute($aEntry['title']),
                'text'  => $aEntry['text'],
                'added' => bx_time_js($aEntry['added']),
            ));
        }
        return $this->parseHtmlByName('page_home.html', array('entries' => $sOut));
    }
}
