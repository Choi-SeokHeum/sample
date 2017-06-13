# Cluster-HMI-Application
Cluster is an application displaying the infomation of vehicle such as fuel, speed, RPM, etc.
It communicates with the OnBoardProvider using DBus.

## Installation
### Tested Environment
Cluster Application is implemented and tested on:
* VMWare Workstation 12 Player (12.1.1 build-3770994)
* Ubuntu 14.04 64bit
* Qt 5.6.1 (for test application)

### Precondition
To build DataProvider, following package are required
* CommonAPI 3.1.5 (including DBus and SOME/IP Runtime)
* RaspberryPi SDK (build environment)

### Clone Source Codes
Clone source codes from GENIVI GitHub using following command in the terminal window:

#### CDL

      $ git clone https://github.com/GENIVI/cat-data-logger.git
    
      $ git checkout abstract-component-poc
      
##### Build & Install
