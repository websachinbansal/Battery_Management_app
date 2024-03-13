import 'package:flutter/material.dart';

import '../buttons/odometer.dart';
import '../buttons/switch_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../pages/scrollablewidget.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<StatefulWidget> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    var boldstyle = const TextStyle(fontWeight: FontWeight.bold, color: Color.fromARGB(133, 247, 102, 6));
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.blue,
          foregroundColor: const Color.fromARGB(255, 71, 70, 70),
          title: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('Bluetooth connection'),
              Text(
                'Data Var',
              )
            ],
          )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 2.5,
              width: double.infinity,
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  border: Border.all(width: 2),
                  gradient: const LinearGradient(
                      colors: [Colors.blueAccent, Colors.greenAccent],
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight)),
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 50,
                    width: 100,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      border: Border.all(color: Colors.black12, width: 2),
                      borderRadius: BorderRadius.circular(3),
                      shape: BoxShape.rectangle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset:
                              const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      gradient: const LinearGradient(
                        colors: [Colors.red, Colors.orange],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: const OdometerWidget(
                      duration: Duration(seconds: 10),
                      endNumber: 50,
                    ),
                  ),
                  const Text(
                    'SOC',
                    style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontFamily: AutofillHints.jobTitle,
                        fontSize: 30),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                   Row(
                    children: [
                      const Icon(
                        (Icons.battery_std_sharp),
                        color: Colors.red,
                        size: 50,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Column(
                        children: [Text('Sum Volt', style: boldstyle,), const Text('data var')],
                      ),
                      const Icon(
                        (Icons.battery_charging_full),
                        color: Colors.red,
                        size: 50,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Column(
                        children: [Text('Current', style: boldstyle,), const Text('data var')],
                      ),
                      const Icon(
                        (Icons.battery_unknown),
                        color: Colors.red,
                        size: 50,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Column(
                        children: [
                          Text('Remaining\nCapacity', style: boldstyle,),
                          const Text('data var')
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Chg MOS',
                            style: TextStyle(
                                fontStyle: FontStyle.italic,
                                fontFamily: AutofillHints.jobTitle,
                                fontSize: 15),
                          ),
                        ),
                      ),
                      SwitchButton(),
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: Text(
                          'Dischg MOS',
                          style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontFamily: AutofillHints.jobTitle,
                              fontSize: 15),
                        ),
                      ),
                      SwitchButton(),
                      SizedBox(
                        width: 5,
                      ),
                     
                      Expanded(child: Text('Balance')),
                       SwitchButton(),
                    ],
                  ),
                ],
              ),
            ),
           SingleChildScrollView(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      const Icon(FontAwesomeIcons.volcano),
                      Text('max-volt', style: boldstyle,),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text('Data Var')
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Column(
                    children: [
                      const Icon(Icons.account_circle_outlined),
                      Text('Min-volt', style: boldstyle,),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text('data var')
                    ],
                  ),
                  Column(
                    children: [
                      const Icon(Icons.energy_savings_leaf),
                      Text('Energy', style: boldstyle,),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text('dara var')
                    ],
                  ),
                  Column(
                    children: [
                      const Icon(Icons.abc),
                      Text('diff-volt', style: boldstyle,),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text('dara var')
                    ],
                  ),
                  Column(
                    children: [
                      const Icon(FontAwesomeIcons.circlePlay),
                      Text('Cycles', style: boldstyle,),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text('dara var')
                    ],
                  ),
                  Column(
                    children: [
                      const Icon(FontAwesomeIcons.powerOff),
                      Text('Power KW', style: boldstyle,),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text('dara var')
                    ],
                  ),
                ],
              ),
            ),
            // const SizedBox(
            //   height: 10,
            // ),
            const ScrollableWidget(),
          ],
        ),
      ),
    );
  }
}
