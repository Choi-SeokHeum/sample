# RVIServer

RVIServer is an application implemented as a server using RVI and displays the result of the transferred files with graph.

# Installation

### tested Environment
RVIServer is implemented and tested on:
* VMWare Workstation 12 Player (12.1.1 build-3770994)
* Ubuntu 14.04 64bit
* Qt 5.6.1 (for test application)

### Precondition
To build RVIServer, following package are required
* Boost 1.54 (or later)
    * system, thread, date_time, iostreams
* python 2.7.6
* [rvi_core 0.5.1](https://github.com/GENIVI/rvi_core/releases)

### Clone Source Codes
Clone source codes from GENIVI GitHub using following command in the terminal window:
#### CDL

        $ git clone https://github.com/GENIVI/cat-data-logger.git

        $ git checkout abstract-component-poc

### Build & Install
In RVIServer directory of CDL, build & install using following command:

    $ qmake -r -spec linux-g++
    $ make
    $ sudo make install

After the installation, you can find binary(`RVIServer`) and other file(`rvi_service.py`) for transferring the JSON file in `/usr/lib/rvi_core` directory.

# Usage

### Run
Prepare a terminal window and navigate to the deploy directory of RVIServer.

        $ ./RVIServer

If the `RVIServer` starts, displayed the name of service such as start, data, finish on terminal. Then you should fill in the service name at the `rvi_call.py` located in `/usr/lib/rvi_core` directory.

When running `RVIServer`, two widgets( File Managing view, Historical view ) are displayed on windows.

In the `deploy` directory of RVIServer, you can show the transferred JSON format files in `results` directory.
