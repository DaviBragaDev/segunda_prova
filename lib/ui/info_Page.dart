import 'package:flutter/material.dart';

import 'package:segunda_prova/ui/telaHome_page.dart';
import '../domain/Usuario.dart';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("HELP TADS"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              margin: EdgeInsets.only(top: 8.0),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CircleAvatar(
                      radius: 40,
                      backgroundImage: NetworkImage(
                        "https://instagram.frec10-1.fna.fbcdn.net/v/t51.2885-19/354043756_163040106629830_7128019191599001803_n.jpg?stp=dst-jpg_s150x150&_nc_ht=instagram.frec10-1.fna.fbcdn.net&_nc_cat=110&_nc_ohc=BcvJym6MU-4AX_0RHpK&edm=ACWDqb8BAAAA&ccb=7-5&oh=00_AfDfEJMNzfyjFn3AXMWERHuMGdE-Diw4HwnR4Yp1rtmAvg&oe=65716ED3&_nc_sid=ee9879",
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "David Victor",
                            style: Theme.of(context).textTheme.headline5,
                          ),
                          SizedBox(height: 4),
                          const Text(
                            "Developer",
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(height: 4),
                          GestureDetector(
                            onTap: () {
                              launch("https://github.com/DvdMeneses");
                            },
                            child: const Text(
                              "Github",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Card(
              margin: EdgeInsets.only(top: 8.0),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CircleAvatar(
                      radius: 40,
                      backgroundImage: NetworkImage(
                        "https://avatars.githubusercontent.com/u/112668808?v=4",
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "David Victor",
                            style: Theme.of(context).textTheme.headline5,
                          ),
                          SizedBox(height: 4),
                          const Text(
                            "Developer",
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(height: 4),
                          GestureDetector(
                            onTap: () {
                              launch("https://github.com/DaviBragaDev");
                            },
                            child: const Text(
                              "Github",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
