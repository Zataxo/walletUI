import 'package:flutter/material.dart';
import 'package:wallet/Constants/colors.dart';
import 'package:wallet/Widgets/first_tab.dart';
import 'package:wallet/Widgets/second_tab.dart';

class CreditCards extends StatefulWidget {
  const CreditCards({Key? key}) : super(key: key);

  @override
  State<CreditCards> createState() => _CreditCardsState();
}

class _CreditCardsState extends State<CreditCards> {
  DateTime date = DateTime(2022, 08, 07);
  final dateText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          backgroundColor: background,
          appBar: AppBar(
            leading: const BackButton(color: Colors.white),
            title: const Text('Wallet'),
            centerTitle: true,
            backgroundColor: background,
            toolbarHeight: 65,
            elevation: 0,
            actions: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
            ],
            bottom: TabBar(
              tabs: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    Tab(
                      icon: Icon(
                        Icons.credit_card_rounded,
                        color: Colors.white,
                      ),
                    ),
                    Text('Cards'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    Tab(
                      icon: Icon(
                        Icons.miscellaneous_services,
                        color: Colors.white,
                      ),
                    ),
                    Text('Services')
                  ],
                ),
              ],
            ),
          ),
          body: const TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: [FirstTab(), SecondTab()],
          )),
    );
  }
}
