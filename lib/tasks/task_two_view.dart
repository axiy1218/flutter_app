import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/tasks/message.dart';

class TaskTwoView extends StatefulWidget {
  const TaskTwoView({super.key});

  @override
  State<TaskTwoView> createState() => _TaskTwoViewState();
}

class _TaskTwoViewState extends State<TaskTwoView> {
  int _currentIndex = 0;
  final List<MessageModel> _messages = [
    MessageModel(
        lastMessage: 'How about meeting tomorrow?',
        image: 'assets/image/monkey.jpeg',
        time: DateTime.now(),
        username: 'Laurent'),
    MessageModel(
        lastMessage: 'How about meeting tomorrow?',
        image: 'assets/image/image.jpg',
        time: DateTime.now(),
        username: 'Tracy'),
    MessageModel(
        lastMessage:
            'Some of the packages that demonstrate the highest levels of quality, selected by the Flutter Ecosystem Committee',
        image: 'assets/image/monkey.jpeg',
        time: DateTime.now(),
        username: 'Claire'),
    MessageModel(
        lastMessage:
            'Flutter plugin for Firebase Cloud Messaging, a cross-platform messaging solution that lets ',
        image: 'assets/image/image.jpg',
        time: DateTime.now(),
        username: 'Joe'),
    MessageModel(
        lastMessage:
            'This package provides a library that performs static analysis of Dart code.',
        image: 'assets/image/monkey.jpeg',
        time: DateTime.now(),
        username: 'Mark'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('task 6.2'),
      ),
      body: ListView.builder(
          itemCount: _messages.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final MessageModel message = _messages[index];
            return Card(
              elevation: .0,
              color: Colors.transparent,
              child: ListTile(
                dense: false,
                leading: CircleAvatar(
                  backgroundImage: AssetImage(message.image),
                ),
                trailing: const RotatedBox(
                    quarterTurns: 2, child: Icon(Icons.arrow_back_ios)),
                title: RichText(
                    text: TextSpan(
                        text: "${message.username}\t\t",
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                            fontWeight: FontWeight.w600),
                        children: [
                      TextSpan(
                        text: formatDate(message.time, ['hh', ':', 'mm']),
                        style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 15,
                            fontWeight: FontWeight.normal),
                      )
                    ])),
                subtitle: Text(
                  message.lastMessage,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            );
          }),
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
            labelTextStyle: MaterialStateProperty.all<TextStyle>(
                const TextStyle(color: Colors.white)),
            indicatorColor: Colors.transparent,
            backgroundColor: Colors.pink),
        child: NavigationBar(
          selectedIndex: _currentIndex,
          onDestinationSelected: (newIndex) {
            _currentIndex = newIndex;
            setState(() {});
          },
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.home),
              label: 'Home',
              selectedIcon: Icon(
                Icons.home,
                color: Colors.blue,
              ),
            ),
            NavigationDestination(
              icon: Icon(Icons.message),
              label: 'Message',
              selectedIcon: Icon(
                Icons.message,
                color: Colors.blue,
              ),
            ),
            NavigationDestination(
              icon: Icon(Icons.video_call),
              label: 'Video',
              selectedIcon: Icon(
                Icons.video_call,
                color: Colors.blue,
              ),
            ),
            NavigationDestination(
              icon: Icon(Icons.notification_add),
              label: 'Notification',
              selectedIcon: Icon(
                Icons.notification_add,
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
