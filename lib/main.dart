import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/other_page.dart';

/*
Created by Axmadjon Isaqov on 15:38:20 24.01.2023
© 2023 @axi_dev 
*/
/*
!Theme:::Widgets basics
*/
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

enum Pages { home, other }

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        Pages.home.name: (context) => const HomePage(),
        Pages.other.name: (context) => const MyOtherWidget()
      },
      initialRoute: Pages.home.name,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

enum OurPlatform { android, ios, macos }

class _HomePageState extends State<HomePage> {
  var isLight = false;

  var _platform = OurPlatform.android;

  _checkOS() {
    if (Platform.isAndroid) {
      _platform = OurPlatform.android;
    } else if (Platform.isIOS) {
      _platform = OurPlatform.ios;
    } else {
      _platform = OurPlatform.macos;
    }
    setState(() {});
  }

  @override
  initState() {
    _checkOS();
    super.initState();
  }

  @override
  didChangeDependencies() {
    super.didChangeDependencies();
  }

  //* _show our dialog funksiyasi
  Future<bool> _showOurDialog() async {
    return await showDialog<bool>(
            context: context,
            barrierDismissible: true,
            builder: (context) => AlertDialog(
                  title: const Text('Person'),
                  content: const Text('Chiqishni istaysizmi?'),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(true);
                        },
                        child: const Text('Ha')),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(false);
                        },
                        style:
                            TextButton.styleFrom(backgroundColor: Colors.red),
                        child: const Text('Yo\'q'))
                  ],
                )) ??
        false;
  }

//& cupertino styled diolog
  void _showOurDiologSecond() {
    showCupertinoDialog(
        context: context,
        builder: (context) => CupertinoAlertDialog(
              title: const Text('Info'),
              content: const Text('Bu cupertino dialog'),
              actions: [
                CupertinoDialogAction(
                  child: const Text('Ok'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                CupertinoDialogAction(
                  child: const Text('Ok'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          return _showOurDialog();
        },
        child: Scaffold(
          appBar: AppBar(),
          drawer: Drawer(
            child: Column(
              children: [
                //& drawer header
                Container(
                  height: 250,
                  color: Colors.blue,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  alignment: Alignment.centerLeft,
                  child: RichText(
                    text: const TextSpan(
                        text: 'Full Name \n',
                        style: TextStyle(
                            color: Colors.yellow,
                            fontWeight: FontWeight.w600,
                            fontSize: 25,
                            fontStyle: FontStyle.italic),
                        children: [
                          TextSpan(
                            text: 'example@gmail.com\n',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 20,
                                fontStyle: FontStyle.normal),
                          ),
                          TextSpan(
                            text: 'example@gmail.com',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 18,
                                fontStyle: FontStyle.normal),
                          )
                        ]),
                  ),
                ),
                //& drawer body
                Card(
                  child: ListTile(
                    dense: true,
                    title: const Text('Title'),
                    subtitle: const Text('this is subtitle'),
                    onTap: () {
                      _showOurDialog();
                      debugPrint('List Tile PRESSED');
                    },
                    trailing: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(Icons.wifi_tethering_error_outlined),
                    ),
                    leading: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(Icons.home),
                    ),
                  ),
                ),
                //& switch list tile
                Card(
                  child: SwitchListTile(
                    value: isLight,
                    secondary: const Icon(Icons.sunny),
                    title: const Text('Dark Theme'),
                    onChanged: (newValue) {
                      isLight = newValue;
                      setState(() {});
                    },
                  ),
                ),
                //& custon switch list tile
                Card(
                  child: ListTile(
                    dense: true,
                    title: const Text('Ios'),
                    leading: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(Icons.sunny),
                    ),
                    subtitle: const Text('iPhone'),
                    trailing: Switch.adaptive(
                        value: isLight,
                        onChanged: (newValue) {
                          isLight = newValue;
                          setState(() {});
                        }),
                  ),
                ),

                //& custon Radio list tile
                Card(
                  child: CheckboxListTile(
                    value: isLight,
                    title: const Text('RadioListTile'),
                    dense: true,
                    subtitle: const Text('Radio with list tile'),
                    onChanged: (newValue) {
                      isLight = newValue!;
                      log(newValue.toString());
                      setState(() {});
                    },
                  ),
                )
              ],
            ),
          ),
          body: SafeArea(
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  //& material alert diolog
                  ElevatedButton(
                      onPressed: _showOurDialog,
                      child: const Text('Alert Dialog')),
                  const SizedBox(
                    height: 20,
                  ),
                  //& cupertino alert diolog
                  CupertinoButton(
                      onPressed: _showOurDiologSecond,
                      child: const Text('CupertinoAlert Diolog')),

                  const SizedBox(
                    height: 20,
                  ),

                  //* simple dialog
                  CupertinoButton.filled(
                      onPressed: () => _showOurSimpleDiolog(context),
                      child: const Text('Simple diolog')),
                  const SizedBox(
                    height: 20,
                  ),

                  //& cupertino contect menu
                  CupertinoContextMenu(
                    actions: const [
                      CupertinoContextMenuAction(
                        isDefaultAction: true,
                        trailingIcon: CupertinoIcons.share,
                        child: Text('Share'),
                      ),
                      CupertinoContextMenuAction(
                        isDestructiveAction: true,
                        trailingIcon: CupertinoIcons.trash,
                        child: Text('delete'),
                      ),
                    ],
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image.asset(
                        'assets/image/image.jpg',
                        width: 150,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                    ),
                    previewBuilder: (context, animation, child) =>
                        ScaleTransition(
                      scale: animation,
                      child: FadeTransition(opacity: animation, child: child),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  //& adoptive diolog

                  OutlinedButton.icon(
                    onPressed: () {
                      switch (_platform) {
                        case OurPlatform.android:
                          _showOurDialog();
                          break;
                        case OurPlatform.ios:
                          _showOurDiologSecond();
                          break;
                        case OurPlatform.macos:
                          _showOurSimpleDiolog(context);
                          break;
                      }
                    },
                    icon: const Icon(Icons.add),
                    label: const Text('Adoptive diolog'),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}

//! simple diolog
void _showOurSimpleDiolog(BuildContext context) {
  showDialog(
      context: context,
      builder: (context) => SimpleDialog(
            title: const Text('Our simple diolog'),
            children: [
              CupertinoButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('ok')),
              CupertinoButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('ok')),
            ],
          ));
}
