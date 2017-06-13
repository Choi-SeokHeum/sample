# Car Data Logger For PoC

This is the CDL proof of concept for AC.

There are some modules that can operate with `CDL-Daemon` such as `Cluster`, `CAN Router`, `RVIServer`.

- CDLDaemon
  * Collect, Store, Provide to OnBoard / OffBoard vehicle Data.
- Cluster
  * Receive the vehicle data(speed, rpm) from `OnBoardProvider` in `CDLDaemon` with DBus.
