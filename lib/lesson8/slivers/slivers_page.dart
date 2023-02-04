import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final _scaffoldKey = GlobalKey<ScaffoldState>();

class SliversPage extends StatefulWidget {
  const SliversPage({super.key});

  @override
  State<SliversPage> createState() => _SliversPageState();
}

class _SliversPageState extends State<SliversPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: const Drawer(),
      backgroundColor: const Color(0xFFE9E9EA),
      body: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
            backgroundColor: Colors.white.withOpacity(.7),
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.search), label: 'Bosh sahifa'),
              BottomNavigationBarItem(icon: Icon(Icons.search)),
              BottomNavigationBarItem(icon: Icon(Icons.search)),
              BottomNavigationBarItem(icon: Icon(Icons.search)),
              BottomNavigationBarItem(icon: Icon(Icons.search))
            ]),
        tabBuilder: (context, index) => CupertinoTabView(
          builder: (context) => CustomScrollView(
            physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics()),
            slivers: [
              //& sliver app bar
              SliverAppBar(
                centerTitle: true,
                leading: Container(),
                backgroundColor: Colors.transparent,
                elevation: .0,
                title: const Text('Shaxsiy kabinet'),
                actions: [
                  IconButton(
                      onPressed: () {
                        if (_scaffoldKey.currentState!.isDrawerOpen) {
                          _scaffoldKey.currentState!.closeDrawer();
                        } else {
                          _scaffoldKey.currentState!.openDrawer();
                        }
                      },
                      icon: const Icon(CupertinoIcons.settings))
                ],
                primary: true,
                pinned: false,
                floating: true,
                bottom: PreferredSize(
                    preferredSize: const Size(double.infinity, 100),
                    child: Transform.translate(
                        offset: const Offset(0, 40),
                        child: const _CustomListTile())),
                snap: false,
                stretch: true,
                expandedHeight: 200,
                flexibleSpace: FlexibleSpaceBar(
                  stretchModes: const [
                    StretchMode.blurBackground,
                    StretchMode.zoomBackground,
                    // StretchMode.fadeTitle
                  ],
                  background: DecoratedBox(
                    position: DecorationPosition.background,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/image/background_image.jpg',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: SizedBox(
                        height: 80,
                        width: double.infinity,
                        child: Card(
                          elevation: .0,
                          color: Colors.transparent,
                          child: Row(
                            children: [
                              const Expanded(
                                  flex: 2,
                                  child: CircleAvatar(
                                    radius: 40,
                                    backgroundImage: AssetImage(
                                      'assets/image/avatar.jpg',
                                    ),
                                  )),
                              const SizedBox(
                                width: 15,
                              ),
                              Expanded(
                                  flex: 8,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const [
                                      Text(
                                        'First Name',
                                        style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white),
                                      ),
                                      Text(
                                        '+998 99 999 99 99',
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white),
                                      )
                                    ],
                                  ))
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              // SliverPadding(
              //   padding: const EdgeInsets.symmetric(horizontal: 10),
              //   sliver: SliverToBoxAdapter(
              //     child:
              //   ),
              // ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 60,
                ),
              ),
              SliverToBoxAdapter(
                  child: Card(
                elevation: .0,
                margin: EdgeInsets.zero,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    _CustomCardWidget(
                        leading: Icon(
                          Icons.shopping_bag,
                          size: 20,
                        ),
                        text: 'Buyurtmalarim',
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          size: 20,
                        )),
                    Divider(
                      thickness: 1,
                      indent: 55,
                    ),
                    _CustomCardWidget(
                        leading: Icon(
                          CupertinoIcons.chat_bubble,
                          size: 20,
                        ),
                        text: 'Sharxlarim',
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          size: 20,
                        )),
                  ],
                ),
              )),

              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 20,
                ),
              ),

              SliverToBoxAdapter(
                  child: Card(
                elevation: .0,
                margin: EdgeInsets.zero,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    _CustomCardWidget(
                        leading: Icon(
                          CupertinoIcons.chat_bubble,
                          size: 20,
                        ),
                        text: 'Chatlarim',
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          size: 20,
                        )),
                    Divider(
                      thickness: 1,
                      indent: 55,
                    ),
                    _CustomCardWidget(
                        leading: Icon(CupertinoIcons.bell),
                        text: 'Xabarnomalar',
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          size: 20,
                        )),
                    Divider(
                      thickness: 1,
                      indent: 55,
                    ),
                    _CustomCardWidget(
                        leading: Icon(
                          CupertinoIcons.percent,
                          size: 20,
                        ),
                        text: 'Promokodlar',
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          size: 20,
                        )),
                    Divider(
                      thickness: 1,
                      indent: 55,
                    ),
                    _CustomCardWidget(
                        leading: Icon(
                          Icons.settings,
                          size: 20,
                        ),
                        text: 'Sozlamalar',
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          size: 20,
                        )),
                  ],
                ),
              )),

              const SliverToBoxAdapter(
                child: SizedBox(height: 20),
              ),

              SliverToBoxAdapter(
                child: _CustomCardWidget(
                    leading: const CircleAvatar(
                      radius: 13,
                      backgroundImage: NetworkImage(
                        'https://www.samdu.uz/upload/cover-images/61312fa1aa6d7-61312fa1aa6d8-61312fa1aa6d9-61312fa1aa6da.jpg',
                      ),
                    ),
                    text: 'Ilova tili',
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Text(
                          'Ozbekcha',
                          style: TextStyle(color: Colors.grey),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 20,
                        )
                      ],
                    )),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(height: 20),
              ),
              SliverToBoxAdapter(
                  child: Card(
                elevation: .0,
                margin: EdgeInsets.zero,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _CustomCardWidget(
                        leading: const Icon(
                          Icons.room_outlined,
                          size: 24,
                        ),
                        text: 'Shahar',
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            Text(
                              'Toshkent',
                              style: TextStyle(color: Colors.grey),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 20,
                            )
                          ],
                        )),
                    const Divider(
                      thickness: 1,
                      indent: 55,
                    ),
                    const _CustomCardWidget(
                        leading: Icon(CupertinoIcons.map_fill),
                        text: 'Xaritadagi topshirish punktlari',
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          size: 20,
                        )),
                  ],
                ),
              )),

              const SliverToBoxAdapter(
                child: SizedBox(height: 20),
              ),
              SliverToBoxAdapter(
                  child: Card(
                elevation: .0,
                margin: EdgeInsets.zero,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    _CustomCardWidget(
                        leading: Icon(
                          CupertinoIcons.info_circle,
                          size: 20,
                        ),
                        text: 'Malumotnoma',
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          size: 20,
                        )),
                    Divider(
                      thickness: 1,
                      indent: 55,
                    ),
                    _CustomCardWidget(
                        leading: Icon(CupertinoIcons.mail),
                        text: 'Biz bilan bog`lanish',
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          size: 20,
                        )),
                  ],
                ),
              )),

              const SliverToBoxAdapter(
                child: SizedBox(height: 20),
              ),

              SliverToBoxAdapter(
                child: SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: CupertinoButton(
                        color: const Color(0xff732dfc),
                        borderRadius: BorderRadius.circular(5),
                        onPressed: () {},
                        child: const Text('Chiqish')),
                  ),
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(height: 100),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _CustomCardWidget extends StatelessWidget {
  final String text;
  final Widget leading;
  final Widget trailing;
  const _CustomCardWidget(
      {required this.leading, required this.text, required this.trailing});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      elevation: .0,
      child: ListTile(
        dense: true,
        tileColor: Colors.white,
        leading: leading,
        minVerticalPadding: .0,
        visualDensity: const VisualDensity(vertical: -2),
        title: Text(
          text,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
        ),
        trailing: trailing,
        horizontalTitleGap: 0,
      ),
    );
  }
}

//* Custom List Tile Widget
class _CustomListTile extends StatelessWidget {
  const _CustomListTile();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Card(
        elevation: .0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
        child: SizedBox(
          height: 100,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Row(
              children: [
                Expanded(
                    flex: 2,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: const Image(
                        width: 80,
                        image: AssetImage(
                          'assets/image/avatar.jpg',
                        ),
                      ),
                    )),
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                    flex: 6,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        FittedBox(
                          child: Text(
                            'Faol buyurtmalar mavjud emas',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          ),
                        ),
                        Text(
                          'Siri can suggest websites based on how you use apps, such as Mail and News. You can change this in System Settings.',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey),
                        )
                      ],
                    )),
                Expanded(
                    flex: 1,
                    child: Container(
                      alignment: Alignment.centerRight,
                      child: const Icon(
                        Icons.arrow_forward_ios,
                        size: 20,
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
