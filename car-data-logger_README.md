
# Car Data Logger For PoC

This is the CDL proof of concept for AC.

There are some modules that can operate with `CDL-Daemon` such as `Cluster`, `CAN Router`, `RVIServer`.

- CAN Router
  * Store the vehicle data received from the `GENIVI VehicleSimulator` using `VSI`.
- CDLDaemon
  * Collect, Store, Provide with On/Off-BoardProvider vehicle Data.
- Cluster
  * Received the vehicle data from vehicle-data-consumer.
  * Display the vehicle data(speed, rpm).
- RVIServer
  * Receive the data(file of JSON format) from the `OffBoardProvider` using `RVI`.
  * Display the transferred data(file of JSON format) with a graph (Historical View).
- vehicle-data-consumer
  * Received the vehicle data(speed, rpm) from `OnBoardProvider` in the `CDLDaemon` using DBus.
  * Provide the vehicle data to cluster-hmi-application.
  
## Precondition
* [GENIVI] Vehicle Simulator
    * Download pre-build binary :
       * [dropbox](https://www.dropbox.com/sh/jh3pyz7umhtmv0p/AABdQmwAl7LWcT4qlXvhUuS3a?dl=0)   
    * Run :
       * [Unity 5.3.4](https://unity3d.com/kr/)
    * Reference :
       * [GENIVI Vehicle Simulator Project Page](https://at.projects.genivi.org/wiki/display/PROJ/GENIVI+Vehicle+Simulator)
      
## Operation
1. Run the `VehicleSimulator`.
2. Run the `RVIServer`.
3. Run the `CANRouter`, `CDLDaemon`, `vehicle-data-consumer`, `cluster-hmi-application`.
  * `CANRouter` stores the vehicleData after the VehicleSimulator runs.
  * `CDLDaemon` starts to collect vehicle data after the vehicle data is stored using VSI from `CANRouter`.
  * `vehicle-data-consumer` registers to `OnBoardProvider` in `CDLDaemon` to receive the vehicle data using dbus.

### Operated device
#### DeskTop
* GENIVI VehicleSimulator
#### RaspberryPi 3
* CAN Router
* CDLDaemon
* vehicle-data-consumer
* Cluster
#### DeskTop
* RVIServer

Installation and Run categories are on the page of each module.

Please refer to page for more detail.
