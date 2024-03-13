import 'package:flutter/material.dart';

class ScrollableWidget extends StatelessWidget {
  const ScrollableWidget({super.key});

//  const ScrollableWidget(Key? key);

  @override
  Widget build(BuildContext context) {
    var boldstyle = const TextStyle(
        fontWeight: FontWeight.bold, color: Color.fromARGB(212, 0, 12, 19));
    return SingleChildScrollView(
      child: Container(
        color: const Color.fromARGB(255, 159, 209, 235),
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildDataRow('status information', 'datavar'),
                _buildDataRow('Battery Status', 'datavar'),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Num of temp: 4", style: boldstyle),
                // SizedBox(
                //   height: 10,
                // ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('T1: ${'data var'}\u00B0C'),
                    Text('T2: ${'data var'}\u00B0C'),
                  ],
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('T3: ${'data var'}\u00B0C'),
                    Text('T4: ${'data var'}\u00B0C'),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Column(
              children: [
                Text(
                  'MOS Temperature',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text('Data var')
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Cell Volatege: 16',
                  style: boldstyle,
                ),
                _buildcellvoltage(),
                const SizedBox(
                  height: 5,
                ),
                _buildcellvoltage(),
                const SizedBox(
                  height: 5,
                ),
                _buildcellvoltage(),
                const SizedBox(
                  height: 5,
                ),
                _buildcellvoltage(),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                'Cell Internal Resistance: 16',
                style: boldstyle,
              ),
              _buildInternalResistance(),
              const SizedBox(
                height: 5,
              ),
              _buildInternalResistance(),
              const SizedBox(
                height: 5,
              ),
              _buildInternalResistance(),
              const SizedBox(
                height: 5,
              ),
              _buildInternalResistance(),
            ]),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Pack Internal Resistance = DataVar',
              style: boldstyle,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Battery Serial Number : DataVar',
              style: boldstyle,
            ),
            const SizedBox(
              height: 10,
            ),
            Text('Software Version : DataVar', style: boldstyle),
          ],
        ),
      ),
    );
  }

  Widget _buildDataRow(String title, String data) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(
                title,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                data,
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildcellvoltage() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [Icon(Icons.battery_charging_full), Text('DataVar')],
        ),
        Column(
          children: [Icon(Icons.battery_charging_full), Text('DataVar')],
        ),
        Column(
          children: [Icon(Icons.battery_charging_full), Text('DataVar')],
        ),
        Column(
          children: [Icon(Icons.battery_charging_full), Text('DataVar')],
        ),
      ],
    );
  }

  Widget _buildInternalResistance() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [Icon(Icons.battery_saver), Text('DataVar')],
        ),
        Column(
          children: [Icon(Icons.battery_saver), Text('DataVar')],
        ),
        Column(
          children: [Icon(Icons.battery_saver), Text('DataVar')],
        ),
        Column(
          children: [Icon(Icons.battery_saver), Text('DataVar')],
        ),
      ],
    );
  }
}
