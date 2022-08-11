import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

import '../Constants/colors.dart';
import '../model/card_model.dart';

class FirstTab extends StatefulWidget {
  const FirstTab({Key? key}) : super(key: key);

  @override
  State<FirstTab> createState() => _FirstTabState();
}

class _FirstTabState extends State<FirstTab> {
  @override
  Widget build(BuildContext context) {
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

    DateTime date = DateTime(2022, 08, 07);
    final dateText = TextEditingController();

    return Column(
      children: [
        Swiper(
          itemBuilder: (BuildContext context, int index) {
            return flipMeNow(myCards[index], index);
          },
          curve: Curves.easeInOut,
          itemCount: myCards.length,
          itemWidth: 350.0,
          itemHeight: 250,
          layout: SwiperLayout.STACK,
          // scrollDirection: Axis.vertical,
          // axisDirection: AxisDirection.up,
        ),
        Container(
          margin: const EdgeInsets.all(8),
          width: 400,
          height: 400,
          decoration: BoxDecoration(
            color: Colors.white10,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                    const Text(
                      '   Add Card',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    const SizedBox(
                      width: 90,
                    ),
                    Text(
                      'Add your debit/credit',
                      style: TextStyle(color: headlines, fontSize: 16),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 50,
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: 370,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20), color: background),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.card_giftcard_outlined),
                        hintText: 'Card number',
                        border: InputBorder.none,
                        hintStyle: TextStyle(color: headlines)),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: 370,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20), color: background),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.person),
                        hintText: 'Card holder name',
                        border: InputBorder.none,
                        hintStyle: TextStyle(color: headlines)),
                  ),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 160,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: background),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: dateText,
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                              hintText: 'Exp Date :'
                                  '${date.year}/${date.month}/${date.day}',
                              prefixIcon: const Icon(Icons.date_range_rounded),
                              border: InputBorder.none,
                              hintStyle:
                                  TextStyle(color: headlines, fontSize: 12)),
                        ),
                      ),
                    ),
                    IconButton(
                        onPressed: () async {
                          DateTime? newDate = await showDatePicker(
                              context: context,
                              initialDate: date,
                              firstDate: DateTime(1900),
                              lastDate: DateTime(2100));

                          if (newDate == null) return;
                          setState(() {
                            date = newDate;
                            dateText.text = newDate.toString().split(' ')[0];
                            //print(date);
                          });
                        },
                        icon: const Icon(Icons.date_range)),
                    Container(
                      width: 160,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: background),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            prefixIcon: const Icon(
                              Icons.security_rounded,
                            ),
                            hintText: 'Security code',
                            border: InputBorder.none,
                            hintStyle:
                                TextStyle(color: headlines, fontSize: 12),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 200,
                height: 50,
                decoration: BoxDecoration(
                  color: const Color(0xff0DA6C2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Next',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  BlurryContainer mainActivites(String img) {
    return BlurryContainer(
      child: Image(
        image: AssetImage(img),
        alignment: Alignment.bottomCenter,
      ),
      blur: 10,
      width: 60,
      height: 60,
      elevation: 5,
      color: background,
      padding: const EdgeInsets.all(8),
      borderRadius: const BorderRadius.all(
        Radius.circular(20),
      ),
    );
  }

  FlipCard flipMeNow(CardModel myData, int indx) {
    List<Color> cardsColors = [
      const Color(0xff320DAF),
      const Color(0xff0DA6C2),
      const Color(0xff61DE70)
    ];
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
