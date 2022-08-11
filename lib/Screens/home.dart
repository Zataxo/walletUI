import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

import '../Constants/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    // double h = MediaQuery.of(context).size.height;
    // double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 10,
        backgroundColor: background,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const ClipRRect(
                  child: Image(
                    image: AssetImage('Assets/avatar.png'),
                    width: 50,
                    height: 50,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Column(
                    children: [
                      const Text(
                        'Welcome Back!',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Hassan Ismat',
                        style: TextStyle(color: headlines),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.notification_add_rounded),
                  color: Colors.white,
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.more_vert),
                  color: Colors.white,
                ),
              ],
            ),
            const SizedBox(
              height: 5.0,
            ),
            Center(
              child: SleekCircularSlider(
                appearance: CircularSliderAppearance(
                  size: 150,
                  spinnerMode: false,
                  infoProperties: InfoProperties(
                    mainLabelStyle: const TextStyle(color: Colors.white),
                    topLabelText: '\$2,456,789',
                    topLabelStyle: const TextStyle(color: Colors.white),
                    bottomLabelText: 'Availble Balance',
                    bottomLabelStyle: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text(
                        'My Transactions',
                        style: TextStyle(color: Colors.white),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      transaction(
                          title: 'Amazon',
                          date: 'May 24, 2022',
                          balance: '- \$103.56',
                          img: 'Assets/Amazon.png'),
                      const SizedBox(
                        height: 10,
                      ),
                      transaction(
                          title: 'Mcdonalds',
                          date: 'May 12 2022',
                          balance: '- \$34.78',
                          img: 'Assets/Mcdonalds.png'),
                      const SizedBox(
                        height: 10,
                      ),
                      transaction(
                          title: 'Apple',
                          date: 'May 8 2022',
                          balance: '- \$1000.97',
                          img: 'Assets/Apple.png'),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

//Creating Transaction//
  Container transaction(
      {required title, required date, required balance, required img}) {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: const Color(0xff7B78AA),
        ),
        borderRadius: BorderRadius.circular(35),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // const SizedBox(
          //   width: 5,
          // ),
          ClipRRect(
            child: Image(image: AssetImage('$img')),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$title',
                  style: const TextStyle(color: Colors.white),
                ),
                Text('$date', style: TextStyle(color: headlines)),
              ],
            ),
          ),
          Container(
            width: 100,
            height: 40,
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: const Color(0xff7B78AA),
              ),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Center(
                child: Text(
              '$balance',
              style: const TextStyle(color: Colors.white),
            )),
          )
        ],
      ),
    );
  }
}