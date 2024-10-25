import 'package:flutter/material.dart';

import '../../widgest/custom_text.dart';
import '../../widgest/custom_widget_mask.dart';
import '../../widgest/heading_text.dart';
import '../chat_screen/chat_screen.dart';
import 'comment_button.dart';


/// For 3/2 feed
class FeedCard2 extends StatelessWidget {
  const FeedCard2({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
          child: Column(
            children: [
              const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomMaskWidget(image: 'assets/Souls(1).png'),
                  Expanded(
                    child: HeadingText(
                      text: ' সংগঠন ছাত্রলীগকে নিষিদ্ধ করেছে সরকার। বুধবার',
                      fontSize: 22,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  const CustomText(text: 'JAMUNA TV', fontSize: 13),
                  const SizedBox(width: 5),
                  const CustomText(text: '5M', fontSize: 13),
                  const SizedBox(width: 5),
                  SizedBox(
                    height: 34,
                    width: 34,
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.people_outlined,
                        size: 20,
                      ),
                      style: IconButton.styleFrom(
                          backgroundColor: Colors.redAccent,
                          padding: EdgeInsets.zero),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        AspectRatio(
          aspectRatio: 3/2,
          child: Material(
            color: Colors.blue,
            child: Image.asset(
              'assets/Cover.png',
              fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0, top: 10, bottom: 10),
          child: Row(
            children: [
              const CommentButton(commentText: '101',assetImagePath: 'assets/flowers/Rui.png',),              const SizedBox(width: 5),
              CommentButton(
                commentText: '58',
                assetImagePath: 'assets/Icons/Comment.png',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ChatScreen(),
                    ),
                  );
                },
              ),
              const SizedBox(width: 5),
              const CommentButton(
                commentText: 'PENDING',
                iconData: Icons.currency_exchange_sharp,
              ),
              const Spacer(),
              const CommentButton(
                commentText: '8',
                iconData: Icons.wrap_text,
              ),
              const Icon(Icons.more_vert),
            ],
          ),
        ),
      ],
    );
  }
}
