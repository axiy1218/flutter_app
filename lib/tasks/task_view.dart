import 'package:flutter/material.dart';

class TaskOneView extends StatefulWidget {
  const TaskOneView({super.key});

  @override
  State<TaskOneView> createState() => _TaskOneViewState();
}

class _TaskOneViewState extends State<TaskOneView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('task one view'),
      ),
      drawer: Drawer(
        child: _drawerBody(),
      ),
    );
  }

  Widget _drawerBody() {
    return Column(
      children: [
        //* drawer header
        Container(
          color: Colors.blue,
          width: double.infinity,
          height: 270,
          padding: const EdgeInsets.only(left: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //&circle avatar
              const CircleAvatar(
                radius: 50,
                backgroundColor: Colors.white,
                child: Text(
                  'M',
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w700,
                      color: Colors.blue),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              //& texts
              RichText(
                  text: const TextSpan(
                      text: 'Michael Clark\n',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                      children: [
                    TextSpan(
                      text: 'michael@gmail.com',
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.normal),
                    )
                  ]))
            ],
          ),
        ),
        //* drawer body

        _customCardWidget(icon: Icons.home, text: 'Home', color: Colors.blue),
        _customCardWidget(
            icon: Icons.person, text: 'Profile', color: Colors.grey),
        _customCardWidget(
            icon: Icons.people_alt, text: 'About', color: Colors.grey)
      ],
    );
  }

  Widget _customCardWidget(
      {required IconData icon, required String text, required Color color}) {
    return Card(
      elevation: .0,
      color: Colors.transparent,
      child: ListTile(
        onTap: () {},
        leading: Icon(
          icon,
          size: 30,
          color: color,
        ),
        title: Text(
          text,
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w600, color: color),
        ),
        dense: true,
      ),
    );
  }
}
