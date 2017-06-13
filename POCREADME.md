# Car Data Logger For PoC

This is the CDL proof of concept for AC.

There are some modules that can operate with `CDL-Daemon` such as `Cluster`, `CAN Router`, `RVIServer`.

- CAN Router
  * Store the vehicle data received from the GENIVI VehicleSimulator using VSI.
- CDLDaemon
  * Collect, Store, Provide to On/Off-Board vehicle Data.
- Cluster
  * Receive the vehicle data(speed, rpm) from `OnBoardProvider` in the `CDLDaemon` with DBus.
