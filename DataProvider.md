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
* CommonAPI 3.1.5 (including DBus and SOME/IP Runtime)

### Clone Source Codes
Clone source codes from GENIVI GitHub using following command in the terminal window:

#### CDL

      $ git clone https://github.com/GENIVI/cat-data-logger.git
    
      $ git checkout trial-integration-with-rvi
      
### Build & Install
In order to build the project the pkgconfig files of the patched libdbus library must be added to the PKG_CONFIG_PATH. For example, if the patched libdbus library is available in /usr/local, set the PKG_CONFIG_PATH variable as follows:

    $ export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig:$PKG_CONFIG_PATH

#### DataProvider build & install
In DataProvider directory of CDL, build & install using following command:

    $ mkdir build
    $ cd build
    $ cmake ..
    $ make
    $ sudo make install
    
#### Test Application build & install
Navigate to the test directory of DataProviderTestApp/ DBusClientTestApp(1~2), and build & install using following command:

    $ qmake -r -spec linux-g++
    $ make
    $ make install
    
After the installation, you can find binary(Data Provider Test Application) in deploy directory.

## Usage

### Run
Prepare one termial windows and navigate to the deploy directory of test.
Before run test application, add library search path for `DataProvider` library to the `LD_LIBRARY_PATH` using following command in terminal:

      $ export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib

Run DataProvider Test application on terminal

      $ cd ../deploy
      $ ./DataProviderTestApp
      
The DataProviderTestApp generates cdl sample data randomly, and call the provideData function located in DataProvider.

Run DBusClientTestApp1 / DBusClientTestApp2 application on each terimals

      $ ./DBusClientTestApp1
      $ ./DBusClientTestApp2
      
DBusClientTestApp(1 ~ 2) are provided the data from the DataProvider according to the information of data requested at the time of registration.
Also, they can be provided wantede data by requesting when they need.
