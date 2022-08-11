import 'package:card_swiper/card_swiper.dart';
import 'package:flip_card/flip_card.dart';
import '../model/card_model.dart';
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
  List<CardModel> myCards = [
    CardModel(
        securtityCode: '5000 **** **** 2372',
        expDate: '01/22',
        cardHolder: 'Hassan ismat'),
    CardModel(
        securtityCode: '5000 **** **** 2372',
        expDate: '05/25',
        cardHolder: 'Mohammed Alkhatim'),
    CardModel(
        securtityCode: '5000 **** **** 2372',
        expDate: '06/27',
        cardHolder: 'Mohammed Almotasim')
  ];
  List<Color> cardsColors = [
    const Color(0xff320DAF),
    const Color(0xff0DA6C2),
    const Color(0xff61DE70)
  ];
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
            Swiper(
              itemBuilder: (BuildContext context, int index) {
                return flipMeNow(myCards[index], index);
              },
              curve: Curves.bounceInOut,
              itemCount: myCards.length,
              itemWidth: 350.0,
              itemHeight: 250,
              layout: SwiperLayout.STACK,
              // scrollDirection: Axis.vertical,
              // axisDirection: AxisDirection.up,
            ),
          ],
        ),
      ),
    );
  }

  FlipCard flipMeNow(CardModel myData, int indx) {
    return FlipCard(
      fill: Fill
          .fillBack, // Fill the back side of the card to make in the same size as the front.
      direction: FlipDirection.HORIZONTAL, // default
      front: Container(
        child: frontCard(myData, cardsColors[indx]),
      ),
      back: Container(
        child: backCard(cardsColors[indx]),
      ),
    );
  }

  Container frontCard(CardModel myData, Color fontColor) {
    return Container(
      width: 400,
      height: 250,
      decoration: BoxDecoration(
          color: fontColor, borderRadius: BorderRadius.circular(25)),
      child: Card(
        color: Colors.transparent,
        elevation: 0,
        margin: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            Row(
              children: const [
                SizedBox(
                  width: 20,
                ),
                Image(
                  image: AssetImage('Assets/chip.png'),
                  height: 30,
                  width: 30,
                ),
                SizedBox(
                  width: 10,
                ),
                Image(
                  image: AssetImage('Assets/Contactless Indicator.png'),
                  height: 20,
                  width: 20,
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                Text(
                  myData.securtityCode.toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 35,
                ),
                const Text(
                  'Valid untill  ',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                Text(
                  myData.expDate.toString(),
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                Text(
                  myData.cardHolder.toString(),
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  width: 90,
                ),
                const Image(
                  image: AssetImage('Assets/Payment System Logo.png'),
                  height: 30,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Container backCard(Color backColor) {
    return Container(
      width: 400,
      height: 250,
      decoration: BoxDecoration(
          color: backColor, borderRadius: BorderRadius.circular(25)),
      child: Card(
        color: Colors.transparent,
        elevation: 0,
        margin: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            Row(
              children: const [
                SizedBox(
                  width: 20,
                ),
                Image(
                  image: AssetImage('Assets/chip.png'),
                  height: 30,
                  width: 30,
                ),
                SizedBox(
                  width: 10,
                ),
                Image(
                  image: AssetImage('Assets/Contactless Indicator.png'),
                  height: 20,
                  width: 20,
                ),
              ],
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
