import 'package:flutter/material.dart';
// import 'package:slide_switcher/slide_switcher.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:wallet/Constants/colors.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override

  // CreditCards x = CreditCards();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: background,
        elevation: 0,
        leading: const BackButton(),
        toolbarHeight: 10,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: const [
                BackButton(
                  color: Colors.white,
                ),
                Text(
                  'Statistics',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            ToggleSwitch(
              initialLabelIndex: 0,
              minWidth: 100,
              totalSwitches: 3,
              labels: const ['Week', 'Month', 'Year'],
              cornerRadius: 15,
              radiusStyle: true,
              activeFgColor: Colors.white,
              inactiveFgColor: headlines,
              animate: true,
              curve: Curves.easeInOut,
              dividerColor: Colors.blueGrey,
              onToggle: (index) {
                // print('switched to: $index');
              },
            ),
            const SizedBox(
              height: 40,
            ),
            const Text(
              'Total Spending',
              style: TextStyle(color: Color(0xff7B78AA), fontSize: 15),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              '\$3,660.00',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            const SizedBox(
              height: 10,
            ),
            ToggleSwitch(
              minWidth: 200.0,
              initialLabelIndex: 1,
              cornerRadius: 10.0,
              activeFgColor: Colors.white,
              inactiveBgColor: Colors.grey,
              inactiveFgColor: Colors.white,
              totalSwitches: 2,
              labels: const ['Income', 'Outcome'],
              icons: const [Icons.arrow_downward, Icons.arrow_upward],
              animate: true,
              curve: Curves.easeInOut,
              activeBgColors: const [
                [Colors.green],
                [Colors.red]
              ],
              onToggle: (index) {
                print('switched to: $index');
              },
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
