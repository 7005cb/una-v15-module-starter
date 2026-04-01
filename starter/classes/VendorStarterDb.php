<?php defined('BX_DOL') or die('hack attempt');
bx_import('BxDolModuleDb');
class VendorStarterDb extends BxDolModuleDb
{
    protected $_sTableMain   = 'bx_vendorstarter_entries';
    protected $_sFieldId     = 'id';
    protected $_sFieldAuthor = 'author';
    protected $_sFieldTitle  = 'title';
    public function __construct(&$oConfig)
    {
        parent::__construct($oConfig);
    }
    public function getEntries($aParams = array())
    {
        $iLimit  = isset($aParams['limit'])  ? (int)$aParams['limit']  : 10;
        $iOffset = isset($aParams['offset']) ? (int)$aParams['offset'] : 0;
        return $this->getAll(
            "SELECT * FROM `{$this->_sTableMain}`
             WHERE `status`='active' AND `status_admin`='active'
             ORDER BY `added` DESC LIMIT {$iOffset},{$iLimit}"
        );
    }
    public function getEntryById($iId)
    {
        return $this->getRow(
            "SELECT * FROM `{$this->_sTableMain}` WHERE `id`=" . (int)$iId
        );
    }
    public function addEntry($aData)
    {
        return $this->query(
            "INSERT INTO `{$this->_sTableMain}` SET " . $this->arrayToSQL($aData)
        );
    }
}
