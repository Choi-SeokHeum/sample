# can_router
can_router is an application operating between GENIVI VehicleSimulator and cdl_daemon.

It is implemented as a Server using socket to communicate with the VehicleSimulator(Implemented Socket Client).
And it also communicated with [CANdevStudio (branch amm17)](https://github.com/GENIVI/CANdevStudio/tree/amm17) using CAN2USB serial cables.

After receiving the vehicle data(speed, rpm) from VehicleSimulator, it stores them using VSI.

## Installation
### Tested Environment
can_router Application is implemented and tested on:
* VMWare Workstation 12 Player (12.1.1 build-3770994)
* Ubuntu 14.04 64bit
* Qt 5.6.1

### Precondition
To build can_router, following package are required
* automotive-dlt 2.15 (or later)
* VSI
   * Install & Build : [VSI Build (cdl_daemon README)](https://github.com/GENIVI/car-data-logger/tree/abstract-component-poc/cdl_daemon/README.md)

### Clone Source Codes
Clone source codes from GENIVI GitHub using following command in the terminal window:

#### CDL

      $ git clone https://github.com/GENIVI/cat-data-logger.git

      $ git checkout abstract-component-poc

### Build & Install
#### can_router build & install
In `can_router` directory of CDL, build & install using following command:

      $ qmake -r -spec linux-g++
      $ make
      $ make install

After the installation, you can find binary(can_router) in `deploy/x86` directory.

#### CANdevStudio build
After clone the `CANdevStudio` from the GENIVI github, copy patch files in `cdl_daemon` directory to `CANdevStudio` directory and apply patches.
* modified_can_signal_to_cdl_daemon.patch
* genivi_17amm_script.patch

        $ patch -p1 < modified_can_signal_to_cdl_daemon.patch
        $ patch -p1 < genivi_17amm_script.patch

After that, build the `CANdevStudio` refer to the `README.md`(CANdevStudio).

## Usage
### Run
### CANdevStudio
Before run the `CANdevStudio`, prepare two terminals window and following command:
terminal_1:
	$ sudo slcan_attach -o -w -f -s3 -c -n can0 /dev/ttyUSB0
	
terminal_2:
	$ sudo modprobe vcan
	$ sudo ip link set can0 up

Run `CanDevStudio` on the terminal_2.

### can_router 
Prepare one terminal window and navigate to the `deploy/x86` directory.

      $ cd deploy/x86

Run `can_router` on terminal:

      $ ./can_router
