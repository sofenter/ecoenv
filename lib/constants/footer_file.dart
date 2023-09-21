import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FooterConstants extends StatelessWidget {
  const FooterConstants({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(
          thickness: 0.5,
        ),
        Wrap(
          direction: Axis.horizontal,
          runAlignment: WrapAlignment.spaceEvenly,
          children: [
            TextButton(onPressed: () {}, child: const Text("About")),
            TextButton(onPressed: () {}, child: const Text("Privacy")),
            TextButton(onPressed: () {}, child: const Text("FAQs")),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
                onPressed: () {},
                icon: const FaIcon(
                  FontAwesomeIcons.whatsapp,
                  color: Colors.green,
                )),
            IconButton(
                onPressed: () {},
                icon: const FaIcon(
                  FontAwesomeIcons.youtube,
                  color: Colors.red,
                )),
            IconButton(
                onPressed: () {},
                icon: const FaIcon(
                  FontAwesomeIcons.twitter,
                  color: Colors.blue,
                )),
            IconButton(
                onPressed: () {},
                icon: const FaIcon(
                  FontAwesomeIcons.shareNodes,
                  color: Colors.indigo,
                )),
          ],
        ),
        // SizedBox(height: 10,),
        Text(
          "©️ EcoEnv - 2023",
        ),
      ],
    );
  }
}
