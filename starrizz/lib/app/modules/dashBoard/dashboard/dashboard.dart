import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:starrizz/app/modules/Notification/notification.dart';
import 'package:starrizz/app/modules/WishList/wishList.dart';
import 'package:starrizz/app/modules/dashBoard/dashboard/profile/profile.dart';

import '../../OrderHistory/orderHistory.dart';
import '../../transactionHistory/transactionHistory.dart';
import 'home/home.dart';
import 'listing/listing.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return
    Scaffold(
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
            screen: const OrderHistory(),
            item: ItemConfig(
              activeForegroundColor: Colors.black,
              icon: const Icon(Icons.list_alt_outlined),
            ),
          ),
          PersistentTabConfig(
            screen: const WishListItem(),
            item: ItemConfig(
              icon: const Icon(Icons.favorite_border),
              activeForegroundColor: Colors.black,
            ),
          ),
          PersistentTabConfig(
            screen: const NotificationList(),
            item: ItemConfig(
              icon: const Icon(Icons.notifications_none_outlined),
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
        navBarBuilder: (navBarConfig) => Style3BottomNavBar(
          navBarConfig: navBarConfig,
        ),
      ),
    );

  }
}
