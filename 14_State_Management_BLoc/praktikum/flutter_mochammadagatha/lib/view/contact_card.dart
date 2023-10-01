import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";

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
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 25.0,
                    backgroundColor: Colors.green,
                    child: Center(
                      child: Text(
                        name[0],
                        style: GoogleFonts.roboto(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                       _truncateText(name, 20),
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
                      _truncateText(color, 20),
                        softWrap: true,
                        overflow: TextOverflow.clip,
                      ),
                      Text(
                        _truncateText(filePath, 20),
                        softWrap: true,
                        overflow: TextOverflow.clip,
                      ),
                    ],
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
    String _truncateText(String text, int maxLength) {
    if (text.length <= maxLength) {
      return text;
    }
    return '${text.substring(0, maxLength)}...';
  }
}
