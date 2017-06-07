# CDL Daemon

CDL-Daemon is module which is integrated Collector, Store, On/Off Board Provider units.
 - VSSDataCollector
    * Collect the vehicle data from vsi.
 - DataStore
    * Store the vehicle data in JSON file whenever the vechie data is collected.
 - OnBoardProvider
    * Provide the vehicle data on board to registered clients what they want.
 - OffBoardProvider
    * Provide the stored JSON file to external server using RVI.
    
# Installation

### Tested Envrionment
CDL Daemon is implemented and tested on:
* VMWare Workstation 12 Player (12.1.1 build-3770994)
* Ubuntu 14.04 64bit

### Precondition
To build CDL Daemon, following package are required
* VSI
* sqlite 3.15.0
* Boost 1.54 (or later)
    * system, thread, log, filesystem, date_time, iostreams
* CommonAPI 3.1.5 (including DBus and Some/IP Runtime)
* python 2.7
