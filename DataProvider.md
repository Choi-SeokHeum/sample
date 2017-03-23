# DataProvier
Data Provider is module providing the CDL data received by the Collector to registered clients.

## Installation
### Tested Environment
Data Provider is implemented and tested on:
* VMWare Workstation 12 Player (12.1.1 build-3770994)
* Ubuntu 14.04 64bit
* Qt 5.6.1 (for test application)

### Precondition
To build DataProvider, following package are required
* CommonAPI-3.1.5

### Clone Source Codes
Clone source codes from GENIVI GitHub using following command in the terminal window:

#### CDL

      $ git clone https://github.com/GENIVI/cat-data-logger.git
    
      $ git checkout trial-integration-with-rvi
      
### Build & Install
#### DataProvider build & install
In DataProvider directory of CDL, build & install using following command:

    $ mkdir build
    $ cd build
    $ cmake ..
    $ make
    $ sudo make install
    
### Test Application build & install
Navigate to the test directory of DataProviderTestApp, and build & install using following command:

    $ qmake -r -spec linux-g++
    $ make
    $ make install
