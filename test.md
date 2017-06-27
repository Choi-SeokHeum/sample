# CANRouter
CANRouter is an application operating between GENIVI VehicleSimulator and CDLDaemon.

It is implemented as a Server using socket to communicate with the VehicleSimulator(Implemented Socket Client).

After receiving the vehicle data(speed, rpm) from VehicleSimulator, it stores them using VSI.

## Installation
### Tested Environment
CANRouter Application is implemented and tested on:
* VMWare Workstation 12 Player (12.1.1 build-3770994)
* Ubuntu 14.04 64bit
* Qt 5.6.1 (for test application)

### Precondition
To build CANRouter, following package are required
* automotive-dlt 2.15 (or later)
* VSI
   * Install & Build : [VSI Build(CDLDaemon README)](https://github.com/GENIVI/car-data-logger/tree/abstract-component-poc/CDLDaemon/README.md)

### Clone Source Codes
Clone source codes from GENIVI GitHub using following command in the terminal window:

#### CDL

      $ git clone https://github.com/GENIVI/cat-data-logger.git

      $ git checkout abstract-component-poc

### Build & Install
#### CANRouter build & install
In CANRouter directory of CDL, build & install using following command:

##### Desktop
Build :

      $ qmake -r -spec linux-g++
      $ make
      $ make install

After the installation, you can find binary(CANRouter) in `deploy/x86` directory.

## Usage

### Run
#### Build for testing on Desktop
Prepare one terminal window and navigate to the `deploy/x86` directory.

      $ cd deploy/x86

Run CANRouter on terminal:

      $ ./CANRouter
