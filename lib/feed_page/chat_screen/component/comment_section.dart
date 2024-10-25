import 'package:flutter/material.dart';

import '../../../widgest/custom_widget_mask.dart';
import '../../../widgest/heading_text.dart';
import '../../component/comment_button.dart';

class CommentSection extends StatelessWidget {
  const CommentSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Theme(
          data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
          child: ExpansionTile(
            leading: const SizedBox(
              height: 40,
              width: 40,
              child: CustomMaskWidget(image: 'assets/Souls(1).png'),
            ),
            title: const Text(
              'TANBIR Hossain',
            ),
            subtitle: const Text('data'),
            initiallyExpanded: true,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: HeadingText(
                      text: ' সংগঠন ছাত্রলীগকে নিষিদ্ধ করেছে সরকার। সংগঠন ছাত্রলীগকে নিষিদ্ধ করেছে সরকার।',
                      fontSize: 12,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
                      const CommentButton(commentText: 'Reply', iconData: Icons.share_outlined),
                      IconButton(onPressed: () {}, icon: const Icon(Icons.add_alert_sharp)),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_upward)),
                          const HeadingText(text: '999', fontSize: 12),
                          IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_downward)),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
            onExpansionChanged: (bool expanded) {},
          ),
        ),
      ],
    );
  }
}
