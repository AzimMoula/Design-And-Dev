import 'dart:io';
import 'package:dnd/widgets/content.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:open_file/open_file.dart';
import 'package:url_launcher/url_launcher_string.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final TextStyle style = GoogleFonts.albertSans(
      color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          //optional profile photo
          leading: const Icon(
            Icons.circle,
            size: 35,
            color: Color.fromARGB(255, 57, 103, 255),
          ),
          backgroundColor: Colors.transparent,
        ),
        extendBodyBehindAppBar: true,
        backgroundColor: const Color.fromRGBO(240, 240, 240, 1),
        //background
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Stack(children: [
            Center(
              child: Container(
                height: MediaQuery.sizeOf(context).height / 1.45,
                width: MediaQuery.sizeOf(context).width / 2,
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        blurStyle: BlurStyle.normal,
                        color: Color.fromARGB(255, 57, 103, 255),
                        blurRadius: 120,
                        spreadRadius: 35)
                  ],
                ),
              ),
            ),
            SizedBox.expand(
                child: Image.asset(fit: BoxFit.contain, 'assets/person.png'))
          ]),
        ),
        //Portfolio content
        bottomSheet: DraggableScrollableSheet(
          initialChildSize: 0.35,
          minChildSize: 0.25,
          expand: false,
          builder: (context, controller) {
            return Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25)),
                color: Color(0xDD397BFF),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(25, 50, 25, 0),
                child: ListView(
                  shrinkWrap: true,
                  controller: controller,
                  children: [
                    RichText(
                        text: TextSpan(style: style, children: [
                      const TextSpan(
                        text: 'I\'m ',
                      ),
                      TextSpan(
                        text: 'Karishma',
                        style: style.copyWith(color: const Color(0xFF232323)),
                      ),
                      const TextSpan(
                        text: '. I love design and this is my portfolio. ',
                      )
                    ])),
                    const SizedBox(height: 25),
                    const Content(title: 'skills', skills: [
                      '3d Artist',
                      'Motion Graphics',
                      'Sketching',
                      'UI designer',
                      'Illustration'
                    ]),
                    const Content(title: 'experience', skills: [
                      '3d Artist',
                      'Motion Graphics',
                      'Sketching',
                    ]),
                    const SizedBox(height: 35),
                    Text(
                      'download CV',
                      style: style.copyWith(fontSize: 25),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.white,
                                  blurRadius: 20,
                                  spreadRadius: -5)
                            ]),
                        child: ElevatedButton(
                          onPressed: () async {
                            final ByteData data = await rootBundle
                                .load('assets/sample.pdf'); //actual file name
                            final directory = Directory(
                                '/storage/emulated/0/Download'); //downloads folder
                            final path =
                                '${directory.path}/sample.pdf'; //new file name
                            final file = File(path);
                            file.writeAsBytes(data.buffer.asUint8List());
                            if (file.existsSync()) {
                              //shows a confirmation that the file has been downloaded
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text(
                                          'Downloaded CV to Downloads folder')));
                            }
                            //opens the file
                            await OpenFile.open(path);
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              shadowColor: Colors.white,
                              elevation: 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Download CV',
                                style: style.copyWith(
                                    color: const Color(0xFF397BFF),
                                    fontSize: 15),
                              ),
                              const Icon(Icons.arrow_downward_rounded)
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 35),
                    Text(
                      'Get In Touch',
                      style: style,
                    ),
                    Wrap(
                      children: [
                        IconButton(
                          onPressed: () {
                            launchUrlString('https://www.github.com',
                                mode: LaunchMode.inAppWebView);
                          },
                          icon: const FaIcon(FontAwesomeIcons.github),
                        ),
                        IconButton(
                          onPressed: () {
                            launchUrlString('https://www.linkedin.com',
                                mode: LaunchMode.inAppWebView);
                          },
                          icon: const FaIcon(FontAwesomeIcons.linkedinIn),
                        ),
                        IconButton(
                          onPressed: () {
                            launchUrlString('https://www.x.com',
                                mode: LaunchMode.inAppWebView);
                          },
                          icon: const FaIcon(FontAwesomeIcons.xTwitter),
                        ),
                      ],
                    ),
                    const SizedBox(height: 25),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
