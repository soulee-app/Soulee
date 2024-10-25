import 'package:flutter/material.dart';
import 'package:navbar/feed_page/component/feed_card_2.dart';
import 'component/feed_card_1.dart';
import 'component/feed_card_3.dart';


class FeedPage extends StatelessWidget {
  const FeedPage({super.key});

  @override
  Widget build(BuildContext context) {

    final List feedCard = [
      const FeedCard1(),
      const FeedCard2(),
      const FeedCard3(),
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView.builder(
        itemCount: feedCard.length, // Display FeedCard 3 times
        itemBuilder: (context, index) {
          return Material(
            color: Colors.transparent,
            child: feedCard[index],
          );
        },
      ),
    );
  }
}

