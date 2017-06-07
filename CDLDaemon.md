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
