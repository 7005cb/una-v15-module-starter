<?php defined('BX_DOL') or die('hack attempt');
bx_import('BxDolModule');
class VendorStarterModule extends BxDolModule
{
    public function __construct(&$aModule)
    {
        parent::__construct($aModule);
    }
    public function serviceGetHome()
    {
        $aEntries = $this->_oDb->getEntries(array(
            'limit' => (int)getParam('bx_vendorstarter_per_page'),
        ));
        if (empty($aEntries))
            return MsgBox(_t('_bx_vendorstarter_txt_no_entries'));
        return $this->_oTemplate->displayEntries($aEntries);
    }
    public function serviceGetSafeFields()
    {
        return array('id','author','title','text','added','changed','status');
    }
}
