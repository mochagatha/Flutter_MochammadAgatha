import "package:flutter/material.dart";
// import "package:flutter_profile_picture/flutter_profile_picture.dart";

class ContactCard extends StatelessWidget {
  final String name;
  final String number;
  final String date;
  final String color;
  final String filePath;

  final void Function()? edit;
  final void Function()? delete;

  const ContactCard({
    super.key,
    required this.name,
    required this.number,
    this.edit,
    this.delete,
    required this.date,
    required this.color,
    required this.filePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // ProfilePicture(
          //   name: name,
          //   radius: 25,
          //   fontsize: 20,
          //   count: 2,
          // ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    name,
                    softWrap: true,
                    overflow: TextOverflow.clip,
                  ),
                  Text(
                    number,
                    softWrap: true,
                    overflow: TextOverflow.clip,
                  ),
                  Text(
                    date,
                    softWrap: true,
                    overflow: TextOverflow.clip,
                  ),
                  Text(
                    color,
                    softWrap: true,
                    overflow: TextOverflow.clip,
                  ),
                  Text(
                    filePath,
                    softWrap: true,
                    overflow: TextOverflow.clip,
                  ),
                ],
              ),
            ),
          ),
          IconButton(
            onPressed: edit,
            icon: const Icon(Icons.mode_edit),
          ),
          IconButton(
            onPressed: delete,
            icon: const Icon(Icons.delete),
          ),
        ],
      ),
    );
  }
}