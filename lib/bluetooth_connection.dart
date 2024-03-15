import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:permission_handler/permission_handler.dart';

import 'application/pages/custom_bottom_navigation.dart';
import 'model/data/data_reading.dart';

class BlueConnect extends StatefulWidget {
  const BlueConnect({super.key});

  @override
  _BlueConnectState createState() => _BlueConnectState();
}

class _BlueConnectState extends State<BlueConnect> {
  // FlutterBluePlus flutterBlue = FlutterBluePlus();
  List<BluetoothDevice> devices = [];
  // List<List<int>> lastThreeConvertedArrays = [];
  List<int> dataBuffer = [];
  List<int> latestData = [];
  // DataStorage dataStore = DataStorage();

  @override
  void initState() {
    super.initState();
    startScanning();
  }

  void startScanning() async {
    // Request location permission
    var permissionStatus = await Permission.location.request();
    if (permissionStatus != PermissionStatus.granted) {
      // Handle the case where the user denies permission
      print('Location permission denied');
      return;
    }

    //listen to scan results
    var subscription = FlutterBluePlus.onScanResults.listen((results) {
      for (ScanResult result in results) {
        if (!devices.contains(result.device)) {
          setState(() {
            devices.add(result.device);
          });
        }
      }
    }, onError: (e) => print(e));

    // FlutterBluePlus.scanMode.listen((scanMode) {
    //   print('Scan mode: $scanMode');
    // });

    // FlutterBluePlus.isScanning.listen((isScanning) {
    //   print('Is scanning: $isScanning');
    // });

    //Cleanup: cancel subscription when scanning stops
    FlutterBluePlus.cancelWhenScanComplete(subscription);

    // Wait for Bluetooth enabled
    await FlutterBluePlus.adapterState
        .where((val) => val == BluetoothAdapterState.on)
        .first;

    //Start scanning w/timeout
    await FlutterBluePlus.startScan(
        withServices: [],
        withNames: [],
        timeout: const Duration(minutes: 2),
        androidUsesFineLocation: true);

    //wait for scanning too stop
    await FlutterBluePlus.isScanning.where((val) => val == false).first;
  }

  Future<void> connectTODevice(BluetoothDevice device) async {
    // listen for disconnection
    var subscription =
        device.connectionState.listen((BluetoothConnectionState state) async {
      if (state == BluetoothConnectionState.disconnected) {
        print("device is disconnected right now");

        //${device.disconnectReasonCode} ${device.disconnectReasonDescription}*** this has been replaced with error message in print
      }
    });

    // cleanup: cancel subscription when disconnected
    device.cancelWhenDisconnected(subscription, delayed: true, next: true);



    // Connect to the device
    await device.connect();
    // After successful connection, navigate to BottomNavigation

    // Navigator.push(context,
    //     MaterialPageRoute(builder: (context) => const BottomNavigation()));

    /* discover for the services after sucessfull connection */

    try {
      List<BluetoothService> services = await device.discoverServices();
      for (var service in services) {
        print("Discovered service: ${service.uuid.toString()}");

        for (var characteristic in service.characteristics) {
          print("characteristic : ${characteristic.uuid.toString()}");

          //subscribe to a characteristic here

          final subscription = characteristic.onValueReceived.listen((value) {
            print('value after subscription: $value');

            dataBuffer.addAll(value);
            // print('DataBuffer: $dataBuffer');

            if (dataBuffer.length >= 30) {
              List<int> processedData = convertTo16Bit(dataBuffer);
              print('Latest Processed Data: $processedData');

              setState(() {
                latestData = processedData;
                // dataStore.storeData(latestData);
              });
              dataBuffer.clear();
            }
          }, onError: (error) {
            print('error receiving data $error');
          });

          // cleanup: cancel subscription when disconnected
          device.cancelWhenDisconnected(subscription);
          // subscribe
          // Note: If a characteristic supports both **notifications** and **indications**,
          // it will default to **notifications**. This matches how CoreBluetooth works on iOS.
          await characteristic.setNotifyValue(true);
        }

        // Reads all characteristics
        var characteristics = service.characteristics;
        for (BluetoothCharacteristic c in characteristics) {
          try {
            List<int> value = await c.read();
            print( 'Reading the properties of char $value');
          } catch (e) {
            print("Failed to read characteristic ${c.uuid.toString()}: $e");
          }
        }
      }
    } catch (e) {
      print('Error in discovering the services $e');
    }


  try {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const BottomNavigation()),
      );
    } catch (e) {
      print('Error on navigation');
    }
      
    // Disconnect from device using this function **************************
    // await device.disconnect();

    // cancel to prevent duplicate listeners
    subscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BLE Scanner'),
      ),
      body: ListView.builder(
        itemCount: devices.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(devices[index].platformName),
            subtitle: Text(devices[index].remoteId.toString()),
            // onTap: () {
            //   // Do something when a device is tapped
            // },

            trailing: ElevatedButton(
              child: const Text('connect'),
              onPressed: () => connectTODevice(devices[index]),
            ),
          );
        },
      ),
    );
  }
}

List<int> convertTo16Bit(List<int> input) {
  List<int> result = [];

  for (int i = 0; i < input.length; i += 2) {
    if (i + 1 < input.length) {
      // int combined = (input[i] << 8) + input[i + 1];
      int combined = (input[i + 1] * 256) + input[i];

      result.add(combined);
    }
  }

  return result;
}
