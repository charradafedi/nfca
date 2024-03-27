import 'package:flutter/material.dart';
import 'package:nfcapp/EditPage.dart';
import 'package:nfcapp/Settingspage.dart';
import 'package:nfcapp/homePage.dart';
import 'package:stylish_bottom_bar/model/bar_items.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';



class landPage extends StatefulWidget {
  const landPage({Key? key}) : super(key: key);

  @override
  State<landPage> createState() => _BubbelBarExampleState();
}

class _BubbelBarExampleState extends State<landPage> {
  PageController controller = PageController(initialPage: 0);
  List<Widget> Pages=[homePage(),EditPage(),SettingsPage()];
  var selected = 0;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(resizeToAvoidBottomInset: false,
      body: PageView(
          physics: NeverScrollableScrollPhysics(),
        controller: controller,
        children: Pages
      ),
      bottomNavigationBar: StylishBottomBar(
        option: BubbleBarOptions(
          // barStyle: BubbleBarStyle.vertical,
          barStyle: BubbleBarStyle.horizotnal,
          bubbleFillStyle: BubbleFillStyle.fill,
          // bubbleFillStyle: BubbleFillStyle.outlined,
          opacity: 0.3,
        ),
        items: [


          BottomBarItem(
            icon: const Icon(Icons.list_alt),
            title: const Text('Tags'),
            backgroundColor: Colors.blue,

            // selectedColor: Colors.pink,
            selectedIcon: const Icon(Icons.read_more),
            badge: const Badge(),
            showBadge: true,
          ),




          BottomBarItem(
            icon: const Icon(Icons.network_wifi_outlined),
            title: const Text('Edit'),
            selectedColor: Colors.orange,
            backgroundColor: Colors.orange,
          ),



          BottomBarItem(
            icon: const Icon(Icons.settings),
            title: const Text('Settings'),
            backgroundColor: Colors.purple,
          ),
        ],
        // fabLocation: StylishBarFabLocation.end,
        // hasNotch: true,
        currentIndex: selected,
        onTap: (index) {
          setState(() {
            selected = index;
            controller.jumpToPage(index);
          });
        },
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      //   child: const Icon(Icons.emoji_emotions),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}