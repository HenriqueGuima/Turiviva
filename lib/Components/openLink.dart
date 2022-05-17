import 'package:android_intent_plus/android_intent.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OpenLink extends StatefulWidget {
  final String title;
  final Widget? child;
  final Widget? icon;
  final String link;

  //final String link;

  OpenLink(
      {Key? key,
      required this.title,
      this.child,
      this.icon,
      required this.link})
      : super(key: key);

  @override
  State<OpenLink> createState() => _OpenLinkState();
}

class _OpenLinkState extends State<OpenLink> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.all(3),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                height: 140,
                width: 140,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromRGBO(102, 153, 153, 1),
                  ),
                  onPressed: () {
                    _openLink(widget.link);
                  },
                  child: Container(
                    width: 140,
                    child: Align(
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          widget.icon!,
                          Container(
                            margin: EdgeInsets.only(bottom: 10),
                          ),
                          Text(
                            widget.title,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void _openLink(link) {
  try {
    final AndroidIntent intent = AndroidIntent(
        action: 'action_view',
        data: Uri.encodeFull(link),
        package: 'com.android.chrome');
    intent.launch();
  } catch (e) {
    print('Android Intent Error: $e');
  }
}
