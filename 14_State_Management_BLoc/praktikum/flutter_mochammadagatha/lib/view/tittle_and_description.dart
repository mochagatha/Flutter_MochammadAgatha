import "package:flutter/material.dart";

class TittleDescBox extends StatelessWidget {
  const TittleDescBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
      child: Column(
        children: [
          const Icon(
            Icons.mobile_friendly_rounded,
            size: 24,
          ),
          const SizedBox(
            height: 16,
          ),
          const Text(
            "Create New Contacts",
            style: TextStyle(fontSize: 24),
          ),
          const SizedBox(
            height: 16,
          ),
          const Text(
            'A dialog is a type of modal window that appears in front of app content to provide critical information, or prompt for a decision to be made. ',
            style: TextStyle(fontSize: 14),
          ),
          const SizedBox(
            height: 16,
          ),
          Container(
              width: double.infinity,
              decoration: const ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 0.50,
                    strokeAlign: BorderSide.strokeAlignCenter,
                    color: Color(0xFFCAC4D0),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}