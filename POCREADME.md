# Car Data Logger For PoC

This is the CDL proof of concept for AC.

There are some modules that can operate with `CDL-Daemon` such as `Cluster`, `CAN Router`, `RVIServer`.

- CAN Router
  * Store the vehicle data received from the `GENIVI VehicleSimulator` using `VSI`.
- CDLDaemon
  * Collect, Store, Provide to On/Off-Board vehicle Data.
- Cluster
  * Receive the vehicle data(speed, rpm) from `OnBoardProvider` in the `CDLDaemon` with DBus.
  * Display the vehicle data(speed, rpm).
- RVIServer
  * Receive the data(file of JSON format) from the `OffBoardProvider` using `RVI`.
  * Display the transferred data(file of JSON format) with a graph (Historical View).
  
## Operation
### Operated device
#### DeskTop
* GENIVI VehicleSimulator
#### RaspberryPi 3
* CAN Router
* CDLDaemon
* Cluster
#### DeskTop
* RVIServer


  
  
