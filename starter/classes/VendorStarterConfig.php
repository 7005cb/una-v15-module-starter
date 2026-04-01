<?php defined('BX_DOL') or die('hack attempt');
bx_import('BxDolModuleConfig');
class VendorStarterConfig extends BxDolModuleConfig
{
    public $CNF = array();
    public function __construct($aModule)
    {
        parent::__construct($aModule);
        $this->CNF = array_merge($this->CNF, array(
            'TABLE_ENTRIES'  => 'bx_vendorstarter_entries',
            'URL_HOME'       => 'page.php?i=vendor-starter-home',
            'URL_MANAGE'     => 'page.php?i=vendor-starter-manage',
            'URI_VIEW_ENTRY' => 'vendor-starter-entry',
            'PARAM_PER_PAGE' => getParam('bx_vendorstarter_per_page'),
            'T' => array(
                'TXT_NO_ENTRIES' => '_bx_vendorstarter_txt_no_entries',
            ),
        ));
    }
}
