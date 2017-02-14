# Data Store
Data Store is module storing the CDL data from VSSDataCollector.

#Installation
###Tested Environment
Data Store is implemented and tested on:
* VMWare Workstation 12 Player (12.1.1 build-3770994)
* Ubuntu 14.04 64bit
* Qt 5.6.1 (for test application)

### Precondition
To build Data Store, following package are required
* sqlite3 3.15.0
* Boost 1.54 (or later)
 -  system, thread, filesystem, date_time

### Clone Source Codes
Clone source codes from GENIVI GitHub using following command in the terminal window:

#### CDL

        $ git clone https://github.com/GENIVI/cat-data-logger.git

        $ git checkout trial-integration-with-rvi


### Build & Install
#### Data Store build & install
In Data Store directory of CDL, build & install using following command:

    $ mkdir build
    $ cd build
    $ cmake ..
    $ make
    $ sudo make install
    
