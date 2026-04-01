-- disable.sql — DELETE system registrations (reverse of enable.sql)

DELETE FROM `syspagesblocks`       WHERE `module`  = 'bx_vendorstarter';
DELETE FROM `sysobjectspage`       WHERE `module`  = 'bx_vendorstarter';
DELETE FROM `sysmenuitems`         WHERE `module`  = 'bx_vendorstarter';
DELETE FROM `sysaclactions`        WHERE `Module`  = 'bx_vendorstarter';
DELETE FROM `sysoptions`           WHERE `category_id` IN (SELECT `id` FROM `sysoptionscategories` WHERE `name` = 'bx_vendorstarter');
DELETE FROM `sysoptionscategories` WHERE `name`    = 'bx_vendorstarter';
DELETE FROM `sysalerts`            WHERE `handler_id` IN (SELECT `id` FROM `sysalertshandlers` WHERE `name` = 'bx_vendorstarter');
DELETE FROM `sysalertshandlers`    WHERE `name`    = 'bx_vendorstarter';
DELETE FROM `sysstdpageswidgets`   WHERE `widgetid` IN (SELECT `id` FROM `sysstdwidgets` WHERE `module` = 'bx_vendorstarter');
DELETE FROM `sysstdwidgets`        WHERE `module`  = 'bx_vendorstarter';
DELETE FROM `sysstdpages`          WHERE `name`    = 'bx_vendorstarter';
