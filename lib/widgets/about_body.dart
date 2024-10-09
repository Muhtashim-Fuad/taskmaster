import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AboutPageBody extends StatelessWidget {
  final List<dynamic> content = [
    {
      "label": "01621-723746",
      "icon": "assets/vectors/whatsapp.svg",
    },
    {
      "label": "plabonmuhtashim@gmail.com",
      "icon": "assets/vectors/gmail.svg",
    },
    {
      "label": "https://www.linkedin.com/in/muhtashim-fuad/",
      "icon": "assets/vectors/linkedin.svg",
    },
    {
      "label": "https://www.facebook.com/muhtashim.plabon/",
      "icon": "assets/vectors/facebook.svg",
    },
    {
      "label": "https://github.com/Muhtashim-Fuad",
      "icon": "assets/vectors/github.svg",
    }
  ];

  Future<String> _getAppVersion() async {
    final PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return "${packageInfo.appName}\nVersion ${packageInfo.version}";
  }

  AboutPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    final Color foregroundColor = Theme.of(context).colorScheme.onPrimaryContainer;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            const SizedBox(height: 18.0),
            Center(
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8.0),
                    padding: const EdgeInsets.all(3.0),
                    clipBehavior: Clip.antiAlias,
                    width: 135,
                    height: 135,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      color: foregroundColor,
                      image: const DecorationImage(
                        image: AssetImage("assets/icons/icon.png"),
                      ),
                      border: Border.all(
                        width: 2.0,
                        color: foregroundColor,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  FutureBuilder<String>(
                    future: _getAppVersion(),
                    builder: (context, snapshot) => Text(
                      (snapshot.connectionState == ConnectionState.waiting || snapshot.hasError)
                      ? "Loading..."
                      : snapshot.data!,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 18.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "Muhtashim Fuad",
                    textAlign: TextAlign.left,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                          color: foregroundColor,
                          letterSpacing: 0,
                        ),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    "I'm a developer with a passion for creating apps that are simple, functional, and user-friendly. I enjoy working across different platforms and continuously learning new tools and technologies. You can explore more of my work or get in touch through the links below:",
                    textAlign: TextAlign.justify,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: foregroundColor.withAlpha(185),
                          letterSpacing: 0,
                        ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 18.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(
                content.length,
                (index) => Expanded(
                  child: TextButton(
                    onPressed: null,
                    onLongPress: () => onLongPress(context, index),
                    child: SvgPicture.asset(
                      content[index]["icon"],
                      color: foregroundColor,
                      width: 32.0,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onLongPress(BuildContext context, int index) {
    String selectedText = content[index]["label"];
    Clipboard.setData(ClipboardData(text: selectedText));
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Copied link to clipboard."),
        elevation: 8.0,
      ),
    );
  }
}
