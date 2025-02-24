import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:starrizz/app/modules/Notification/notification.dart';

import '../OrderHistory/orderHistory.dart';
import '../dashBoard/dashboard/addItem/addItem.dart';
import '../dashBoard/dashboard/home/home.dart';
import '../dashBoard/dashboard/listing/listing.dart';
import '../dashBoard/dashboard/profile/profile.dart';
import '../transactionHistory/transactionHistory.dart';
import '../transactionHistory/transfer.dart';
class StarDashboard extends StatelessWidget {
  const StarDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: PersistentTabView(
        tabs: [
          PersistentTabConfig(
            screen: const Home(),
            item: ItemConfig(
              icon: const Icon(Icons.home),
              activeForegroundColor: Colors.black,
            ),
          ),
          PersistentTabConfig(
            screen: const ListingPage(),
            item: ItemConfig(
              activeForegroundColor: Colors.black,
              icon: const Icon(Icons.list_alt_outlined),
            ),
          ),
          PersistentTabConfig(
            screen: const AddItem(),
            item: ItemConfig(
              icon: const Icon(Icons.add),
              activeForegroundColor: Colors.black,
            ),
          ),
          PersistentTabConfig(
            screen: const Transfer(),
            item: ItemConfig(
              icon: const Icon(Icons.attach_money_outlined),
              activeForegroundColor: Colors.black,
            ),
          ),
          PersistentTabConfig(
            screen: const Profile(),
            item: ItemConfig(
              activeForegroundColor: Colors.black,
              icon: const Icon(Icons.person),
            ),
          ),
        ],
        navBarBuilder: (navBarConfig) => Style13BottomNavBar(
          navBarConfig: navBarConfig,
        ),
      ),
    );
  }
}
