import 'package:flutter/material.dart';

class SwitchButton extends StatefulWidget {
  const SwitchButton({super.key});

  @override
  _SwitchButtonState createState() => _SwitchButtonState();
}

class _SwitchButtonState extends State<SwitchButton> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // Text(
          //   isSwitched ? '' : 'Switch is OFF',
          //   style: const TextStyle(fontSize: 20),
          // ),
          const SizedBox(height: 20),
          Transform.scale(
            scale: 0.6,
            
            child: Switch(
                value: isSwitched,
                onChanged: (value) {
                  setState(() {
                    isSwitched = value;
                    // Perform actions based on the switch value
                    isSwitched = true;
                    if (isSwitched) {
                      print('Switch is turned ON');
                      // Do something when switch is ON
                    } else {
                      print('Switch is turned OFF');
                      // Do something when switch is OFF
                    }
                  });
                },
                activeColor: Colors.blue, 
                inactiveThumbColor: Colors.orange,
                inactiveTrackColor: Colors.grey.withOpacity(0.4),
                ),
          )
        ]);
  }
}
