import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wallet/Constants/colors.dart';
import 'package:wallet/model/services_model.dart';

class SecondTab extends StatefulWidget {
  const SecondTab({Key? key}) : super(key: key);

  @override
  State<SecondTab> createState() => _SecondTabState();
}

// generating Examples Using Constructors
class _SecondTabState extends State<SecondTab> {
  // Services accDetails = Services(
  //     name: 'Account Details',
  //     myColor: accountDetailsColor,
  //     img: Icons.account_box_rounded);
  // Services accPayBills = Services(
  //     name: 'Pay Bills',
  //     myColor: accountPayBills,
  //     img: Icons.account_balance_wallet);
  // Services accTransferAmount = Services(
  //     name: 'Money Transfer',
  //     myColor: transferMoney,
  //     img: FontAwesomeIcons.moneyBillTransfer);
  List<Services> myServices = [
    Services(
        name: 'Account Details',
        myColor: accountDetailsColor,
        img: Icons.account_box_rounded),
    Services(
        name: 'Pay Bills',
        myColor: accountPayBills,
        img: Icons.account_balance_wallet),
    Services(
        name: 'Money Transfer',
        myColor: transferMoney,
        img: FontAwesomeIcons.moneyBillTransfer),
  ];
  // generating Examples Using Constructors//

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.count(
        crossAxisCount: 3,
        mainAxisSpacing: 30.0,
        crossAxisSpacing: 20.0,
        children: [...myServices.map((e) => myCardOfServices(e))],
      ),
    );
  }

  Widget myCardOfServices(Services accServices) {
    return GestureDetector(
      onTap: () => print(accServices.name),
      child: Container(
        width: 110,
        height: 110,
        decoration: BoxDecoration(
          color: Colors.white10,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                const SizedBox(
                  width: 20,
                ),
                IconButton(
                  onPressed: () {},
                  icon: accServices.img is String
                      ? SizedBox(
                          height: 50,
                          width: 50,
                          child: Image.asset(
                            accServices.img,
                          ),
                        )
                      : Icon(
                          accServices.img as IconData,
                          size: 52,
                          color: accServices.myColor,
                        ),
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white38,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(25),
                        bottomRight: Radius.circular(25))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(accServices.name,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
