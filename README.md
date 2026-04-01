# una-v15-module-starter

> **The modern replacement for [una-vendor-test](https://github.com/unacms/una-vendor-test)** — updated for UNA CMS 15.0.0-B.

The simplest **complete** UNA CMS 15 module. Use it as a starting point for
any module or as a verified ground-truth reference for AI scaffolding tools
like ModForge.

## What the original una-vendor-test was missing

| Feature                        | una-vendor-test (2014) | This starter (v15) |
|-------------------------------|------------------------|--------------------|
| UNA version                   | Trident (pre-v10)      | **15.0.0-B**       |
| `enable.sql` / `disable.sql`  | ❌                      | ✅                  |
| `sysobjectspage` registration | ❌                      | ✅                  |
| `sysmenuitems` registration   | ❌                      | ✅                  |
| `sysaclactions` permissions   | ❌                      | ✅                  |
| `sysoptions` settings         | ❌                      | ✅                  |
| `sysalertshandlers`           | ❌                      | ✅                  |
| `install/installer.php`       | ❌ wrong name           | ✅ correct          |
| `language_category` in config | ❌                      | ✅ required         |
| `Template.php` class          | ❌                      | ✅                  |
| `AlertsResponse.php` class    | ❌                      | ✅                  |
| Class prefix convention       | `BxVendor...`          | `VendorCap...`     |

## Structure

starter/
├── config.php
├── request.php
├── classes/
│ ├── VendorStarterModule.php
│ ├── VendorStarterConfig.php
│ ├── VendorStarterDb.php
│ ├── VendorStarterTemplate.php
│ └── VendorStarterAlertsResponse.php
├── install/
│ ├── config.php
│ ├── installer.php ← MUST be named installer.php
│ ├── langs/en.xml ← MUST be in install/langs/
│ └── sql/
│ ├── install.sql ← CREATE TABLE only
│ ├── enable.sql ← INSERT system registrations
│ ├── disable.sql ← DELETE system registrations
│ └── uninstall.sql ← DROP TABLE + cleanup
└── template/
├── page_home.html
└── entry_item.html


## Quick start

1. Copy `starter/` to `/path/to/una/modules/vendor/starter/`
2. **Studio → Apps → Downloaded** → find `Vendor Starter` → Install

## Rename for your module

| Placeholder      | Replace with      | Example          |
|------------------|-------------------|------------------|
| `vendor`         | your vendor       | `cb7005`         |
| `starter`        | your module       | `rentals`        |
| `VendorStarter`  | class prefix      | `Cb7005Rentals`  |
| `vendorstarter`  | lowercase combo   | `cb7005rentals`  |
| `Vendor Starter` | display title     | `Rentals`        |

## v15 Naming Rules

- Class prefix = `VendorCap` + `ModuleCap` — e.g. `Cb7005Rentals`
- **No `Bx` prefix on vendor classes** — `Bx` is UNA core only
- DB table prefix = `bx_{vendor}{module}_` — e.g. `bx_cb7005rentals_`
- Language key = `_bx_{vendor}{module}_{key}`
- Module code = module name only — `rentals` NOT `cb7005_rentals`
- Installer file = `install/installer.php` — NOT `install.php`
- Language file = `install/langs/en.xml` — NOT `data/langs/`

## For ModForge (add to system prompt)

When scaffolding a UNA CMS 15 module, follow the structure and conventions
defined in https://github.com/cb7005/una-v15-module-starter exactly.
A module is NOT complete unless all files in that reference exist and
the file listing is verified with: find . -type f | sort


## Credits

Maintained by [cb7005](https://github.com/cb7005).
Based on the original [unacms/una-vendor-test](https://github.com/unacms/una-vendor-test) by Alex Trofimov.
MIT License.
