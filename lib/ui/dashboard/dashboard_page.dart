import 'package:cheraphy/constants/routes.dart';
import 'package:cheraphy/ui/dashboard/pages/chat/chat_page.dart';
import 'package:cheraphy/ui/dashboard/pages/dashboard_main_page.dart';
import 'package:cheraphy/ui/dashboard/pages/volunteer_listener/volunteer_listener_page.dart';
import 'package:cheraphy/ui/providers/page_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  List<Widget> pages = [
    const DashBoardMainPage(),
    const ChatPage(),
    const VolunteerPage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cherapy.com"),
      ),
      drawer: Drawer(
        child: Column(children: [
          SizedBox(
            width: double.infinity,
            child: DrawerHeader(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const FlutterLogo(
                    size: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Username"),
                      IconButton(
                          onPressed: () {
                            Navigator.popAndPushNamed(context, loginPageRoute);
                          },
                          icon: const Icon(Icons.settings))
                    ],
                  ),
                ],
              ),
              decoration: BoxDecoration(color: Colors.blue.shade100),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.dashboard),
            title: const Text("Dashboard"),
            trailing: const Icon(CupertinoIcons.chevron_right),
            onTap: () {
              Provider.of<PageProvider>(context, listen: false)
                  .currentPageIndex = 0;
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.chat_bubble),
            title: const Text("Chat"),
            trailing: const Icon(CupertinoIcons.chevron_right),
            onTap: () {
              Provider.of<PageProvider>(context, listen: false)
                  .currentPageIndex = 1;
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.chat_rounded),
            title: const Text("Volunteer as a listener"),
            trailing: const Icon(CupertinoIcons.chevron_right),
            onTap: () {
              Provider.of<PageProvider>(context, listen: false)
                  .currentPageIndex = 2;
              Navigator.pop(context);
            },
          )
        ]),
      ),
      body: getCurrentPage(),
    );
  }

  getCurrentPage() {
    int currentPageIndex = Provider.of<PageProvider>(context).currentPageIndex;
    return pages[currentPageIndex];
  }
}
