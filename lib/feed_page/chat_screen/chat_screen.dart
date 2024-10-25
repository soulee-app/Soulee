import 'package:flutter/material.dart';

import 'component/comment_section.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: 5,
        itemBuilder: (context, index) {
          double leftPadding = (index + 1) * 10.0;
          return Padding(
            padding: EdgeInsets.only(left: leftPadding,),
            child: const CommentSection(),
          );
        },
      ),
      bottomNavigationBar: _buildBottomCommentInput(),
    );
  }

  Widget _buildBottomCommentInput() {
    return Container(
      height: 80,
      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 8),
      color: Colors.transparent,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Add a comment...',
                filled: true,
                fillColor: Colors.grey.shade200,
                contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),

          IconButton(
            icon: const Icon(Icons.photo_camera, color: Colors.grey),
            onPressed: () {

            },
          ),

          IconButton(
            icon: const Icon(Icons.send, color: Colors.blue),
            onPressed: () {

            },
          ),
        ],
      ),
    );
  }
}
