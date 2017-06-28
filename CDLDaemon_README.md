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
* sqlite 3.8.2 (or later)
* Boost 1.54 (or later)
    * system, thread, log, filesystem, date_time, iostreams
* CommonAPI 3.1.5 (including DBus and Some/IP Runtime)
* python 2.7.6
* rvi_core 0.5.1

### Clone Source Codes
Clone source codes from GENIVI GitHub using following command in the terminal window:
#### VSI
Because the latest version of VSI is not compatible with C ++, the VSS Data Collector is implemented based on [c2b1c0a](https://github.com/GENIVI/vehicle_signal_interface/tree/c2b1c0ab0124aa36a30ddd486cf8b373be7b2c0f) Commit.

        $ git clone https://github.com/GENIVI/vehicle_signal_interface.git

        $ git checkout c2b1c0a

#### CDL

        $ git clone https://github.com/GENIVI/cat-data-logger.git

        $ git checkout abstract-component-poc

### Build & Install
#### VSI build & install
Before build the VSI, apply patches for installation.
Copy patch files in VSSDataCollector(add-make-install.patch, add-package-config-file.patch) to VSI directory and apply patches.

        $ patch -p1 < add-make-install.patch
        $ patch -p1 < add-package-config-file.patch

And build and install VSI using following command:

        $ make
        $ sudo make install

#### CDL Daemon build & install
In CDLDaemon directory of CDL, build & install using following command:

        $ mkdir build
        $ cd build
        $ cmake ..
        $ make
        $ sudo make install

After the installation, you can find a binary(CDLDaemon) and other files for configuration and generated VSS JSON, VSI files in deploy directory. Also you can find python files for RVI in rvi_core(/usr/lib/rvi_core) directory.

### Run
Prepare a terminal window and navigate to the deploy directory of test.
Before run the CDLDaemon application, run the `RVIServer` on the CDL(car-data-logger) to confirm the transferred JSON file between CDLDaemon and external server.

Run CDLDaemon on the terminal.

        $ ../deploy
        $ ./CDLDaemon

