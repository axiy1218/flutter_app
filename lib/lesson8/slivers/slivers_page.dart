import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SliversPage extends StatefulWidget {
  const SliversPage({super.key});

  @override
  State<SliversPage> createState() => _SliversPageState();
}

class _SliversPageState extends State<SliversPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE9E9EA),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        slivers: [
          //& sliver app bar
          SliverAppBar(
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: .0,
            title: const Text('Shaxsiy kabinet'),
            actions: [
              IconButton(
                  onPressed: () {}, icon: const Icon(CupertinoIcons.settings))
            ],
            primary: true,
            pinned: false,
            floating: true,
            bottom: PreferredSize(
                preferredSize: const Size(double.infinity, 100),
                child: Transform.translate(
                    offset: const Offset(0, 50),
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
                                crossAxisAlignment: CrossAxisAlignment.start,
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
          const SliverFillRemaining()
        ],
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
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
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
