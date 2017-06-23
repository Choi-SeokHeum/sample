# Vehicle-Data-Consumer
vehicle-data-consumer is connected with `OnBoardProvider` in `CDLDaemon` to receive the vehicle data using dbus.
After receiving the vehicle data, provides to cluster-hmi-applpication.

## Installation
### Tested Environment
vehicle-data-consumer is implemented and tested on:
* VMWare Workstation 12 Player (12.1.1 build-3770994)
* Ubuntu 14.04 64bit
* Qt 5.6.1 (for test application)

### Precondition
To build vehicle-data-consumer, following package are required
* CommonAPI 3.1.5 (including DBus and SOME/IP Runtime)
* automotive-dlt 2.15 (or later)

### Clone Source Codes
Clone source codes from GENIVI GitHub using following command in the terminal window:

#### CDL

      $ git clone https://github.com/GENIVI/cat-data-logger.git
    
      $ git checkout abstract-component-poc
      
### Build & Install
#### vehicle-data-consumer build & install
In vehicle-data-consumer directory of CDL, build & install using following command:

      $ qmake -r -spec linux-g++
      $ make
      $ make install
      
After the installation, you can find binary(cluster-hmi-application) in deploy/x86 directory.

## Usage

### Run
#### Build on Qt Environment
Prepare one terminal window and navigate to the `deploy/x86` directory.

      $ cd deploy/x86
      
Run vehicle-data-consumer on terminal:
      
      $ ./vehicle-data-consumer
