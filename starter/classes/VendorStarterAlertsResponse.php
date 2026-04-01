<?php defined('BX_DOL') or die('hack attempt');
bx_import('BxDolAlertsResponse');
class VendorStarterAlertsResponse extends BxDolAlertsResponse
{
    protected $_sModule = 'bx_vendorstarter';
    public function __construct()
    {
        parent::__construct();
    }
    public function response($oAlert)
    {
        $oModule = BxDolModule::getInstance($this->_sModule);
        if (!$oModule) return;
        switch ($oAlert->unit) {
            case 'profile':
                if ($oAlert->action === 'delete') {
                    $oModule->_oDb->query(
                        "UPDATE `bx_vendorstarter_entries`
                         SET `status`='hidden'
                         WHERE `author`=" . (int)$oAlert->iObject
                    );
                }
                break;
        }
    }
}
