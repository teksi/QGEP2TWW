# QGEP2TWW
Migration Scripts From QGEP to TEKSI Wastewater

These scripts aims to help to get practical into the migration from QGEP to TEKSI Wastewater.

## Migration path

> [!NOTE]  
> As QGEP uses pum <= 0.1.10, pirogue 1.4.1 and psycopg2 and 
> TWW uses pum >= 1.1.14, pirogue 3.0.0, psycopg (3.x)
> It can be smart to concentrate the efforts on upgrading all QGEP databases
> before trying to migrate and install TWW

It could be useful to handle a separate osgeo4w installation for example in c:\oswgeo4w2 so you don't get t

The migration approach is as following :
 * [Upgrading QGEP](https://github.com/teksi/QGEP2TWW/wiki/Upgrading-QGEP)
   * Create a copy of your production database
   * Drop all views and custom extensions locking primary tables (qgep_od)
   * Upgrade QGEP to latest available version for datamodel and plugin

 * [Make QGEP Conform VSA 2015 and export ready](https://github.com/teksi/QGEP2TWW/wiki/Making-QGEP-Export-Ready)
   * If necessary, drop symbology triggers to avoid high computation time when dealing with mass edits
   * Create QGEP VSA DSS 2015 Export

 * [Conversion of the dataset from 2015->2020.1](https://github.com/teksi/QGEP2TWW/wiki/Converting-2015-2020)
   * Using the VSA converter tool

 * [Starting with TWW](https://github.com/teksi/QGEP2TWW/wiki/Starting-With-TWW)
   * Initialize TWW into latest available version
   * Import organisation data into TWW
   * Import network data into TWW

 * [Project file adaptations](https://github.com/teksi/QGEP2TWW/wiki/Project-file-adaptations)
   * Start with demo project
   * Handle translations
   * Adapt your projects
   * Tips and tricks on project templating

 * [Migrate Adaptations / additional data](https://github.com/teksi/QGEP2TWW/wiki/Dealing-with-customizations)
   * Upgrade 3D geometries (not custom)
   * Add additional custom fields and migrate these
   * Create custom export views and schemas



