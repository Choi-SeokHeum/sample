# RVIServer

RVIServer is an application implemented as a server using RVI and displays the result of the transferred files with graph.

# Installation

### tested Environment
RVIServer is implemented and tested on:
* VMWare Workstation 12 Player (12.1.1 build-3770994)
* Ubuntu 14.04 64bit
* Qt 5.6.1 (for test application)

### Precondition
To build VSS Data Collector, following package are required
* VSI
* Boost 1.54 (or later)
    * system, thread, date_time, iostreams
* python 2.7

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

After the installation, you can find binary(RVIServer) and other file(rvi_service.py) for transferring the JSON file in `/usr/lib/rvi_core` directory.

# Usage

### Run
Prepare a terminal window and navigate to the deploy directory of RVIServer.
Before run applications, add library search path for `VSI` and `VSSDataCollector` library to the `LD_LIBRARY_PATH` using following command in terminal:

        $ export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib

Run RVIServer on the terminal.

        $ ./RVIServer

When running `RVIServer`, two widgets( File Managing view, Historical view ) are displayed on windows.

In the `deploy` directory of RVIServer, you can show the transferred JSON format files in `results` directory.
