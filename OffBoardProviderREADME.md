# OffBoardProvider
Off-Board Provider is module providing the CDL data received by the Collector to external server using RVI.

## Installation
### Tested Environment
OffBoardProvider is implemented and tested on:
* VMWare Workstation 12 Player (12.1.1 build-3770994)
* Ubuntu 14.04 64bit
* Qt 5.6.1 (for test application)

### Precondition
To build OffBoardProvider, following package are required
* python 2.7
* Boost 1.54 (or later)
  * system, thread, log, iostreams
  
### Clone Source Codes
Clone source codes from GENIVI GitHub using following command in the terminal window:

#### CDL

        $ git clone https://github.com/GENIVI/cat-data-logger.git

        $ git checkout abstract_component_poc

### Build & Install
#### Off Board Provider build & install
In OffBoardProvider directory of CDL, build & install using following command:

        $ mkdir build
        $ cd build
        $ cmake ..
        $ make
        $ sudo make install

#### Test Application build & install
Navigate to the test directory of OffBoardProvider, and build & install using following command:
        
        $ qmake -r -spec linux-g++
        $ make
        $ make install
        
After the installation, you can find binary(OffBoardProviderTestApp) and other files(5 sample JSON files) to be transderred to the RVIServer in deploy directory.

### Run
Prepare a terminal window and navigate to the deploy directory of test.
Before run application, run the `RVIServer` on the CDL-Daemon and add library search path for `OffBoardProvider` library to the `LD_LIBRARY_PATH` using following command in terminal:

        $ export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib

Run OffBoardProviderTestApp on the terminal.

        $ ../deploy
        $ ./OffBoardProviderTestApp
        
The OffBoardProvider transfers JSON files stored vehicleData to the `RVIServer` with RVI.
