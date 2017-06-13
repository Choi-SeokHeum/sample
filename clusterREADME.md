# Cluster-HMI-Application
Cluster is an application displaying the infomation of vehicle such as fuel, speed, RPM, etc.
It communicates with the OnBoardProvider using DBus.

## Installation
### Tested Environment
Cluster Application is implemented and tested on:
#### DeskTop
* VMWare Workstation 12 Player (12.1.1 build-3770994)
* Ubuntu 14.04 64bit
* Qt 5.6.1 (for test application)
#### Target Board
* GDP 12 on RaspberryPi 3

### Precondition
To build cluster-hmi-applciation, following package are required
* CommonAPI 3.1.5 (including DBus and SOME/IP Runtime)

### Clone Source Codes
Clone source codes from GENIVI GitHub using following command in the terminal window:

#### CDL

      $ git clone https://github.com/GENIVI/cat-data-logger.git
    
      $ git checkout abstract-component-poc
      
### Build & Install
#### Cluster Application
In cluster-hmi-application directory of CDL, build & install using following command:

##### Desktop
Build :

      $ qmake -r -spec linux-g++
      $ make
      $ make install
      
##### Target Board
Set the Yocto ADT environment:
    
      $  source ${RPI_ADT_DIR}/environment-setup-cortexa7hf-neon-vfpv4-poky-linux-gnueabi
      
Build:
      
      $ qmake
      $ make
      $ make install
    
After the installation, you can find binary(cluster-hmi-application) in deploy directory.

## Usage

### Run
#### Build on Qt Environment
If you build the cluster-hmi-application on Qt, prepare one terminal window and navigate to the `deploy/x86` directory.

      $ cd deploy/x86
      
Run cluster-hmi-application on terminal:
      
      $ ./cluster-hmi-application
      
#### Build on Target Board Environment
If you build the cluster-hmi-application on RaspberryPi, prepare one terminal window and navigate to the `deploy/arm` directory.

      $ cd deploy/arm
      
Run cluster-hmi-application on target board:
      
      $ ./cluster-hmi-application
