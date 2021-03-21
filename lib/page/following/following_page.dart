import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:neumorphism_ui_app/utils/tools.dart';
import 'package:sticky_headers/sticky_headers.dart';

class FollowingPage extends StatefulWidget {
  @override
  _FollowingPageState createState() => _FollowingPageState();
}

class _FollowingPageState extends State<FollowingPage>
    with AutomaticKeepAliveClientMixin {
  List<String> _block = ['英文', '电竞', '启用掉宝', '动画'];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      //physics: const NeverScrollableScrollPhysics(),
      itemCount: 10,
      itemBuilder: (context, index) {
        return FollowingListItem(
          block: _block,
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class FollowingListItem extends StatelessWidget {
  final String cover;
  final String avatar;
  final String author;
  final String title;
  final String type;
  final List<String> block;

  const FollowingListItem({
    Key key,
    this.cover = 'assets/images/1.jpg',
    this.avatar = 'assets/images/1.jpg',
    this.author = 'huau',
    this.title = 'null',
    this.type = 'Warframe',
    this.block,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BoxContainer(
      margin: EdgeInsets.symmetric(horizontal: 2, vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 70,
                height: 50,
                child: Image.asset(
                  cover,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 10,
                          child: Image.asset(avatar),
                        ),
                        SizedBox(width: 5),
                        Text(
                          author,
                          style: TextStyle(
                              fontSize: 14,
                              color: SetColor.mainTypeFace,
                              fontWeight: FontWeight.w500),
                          textAlign: TextAlign.left,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                    Text(
                      title,
                      style:
                          TextStyle(fontSize: 12, color: SetColor.mainTypeFace),
                      textAlign: TextAlign.left,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      type,
                      style: TextStyle(
                          fontSize: 12,
                          color: SetColor.mainTypeFace.withOpacity(0.6)),
                      textAlign: TextAlign.left,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              SizedBox(width: 10),
              Icon(Icons.arrow_drop_down),
            ],
          ),
          SizedBox(height: 5),
          Row(
            children: [
              SizedBox(width: 80),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: block
                      .map(
                        (e) => BoxContainer(
                          sunken: false,
                          margin: EdgeInsets.only(right: 10),
                          padding:
                              EdgeInsets.only(left: 5, right: 5, bottom: 3),
                          child: Text(
                            e,
                            style: TextStyle(fontSize: 10),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/*ListView(
      padding: EdgeInsets.zero,
      children: [
        Container(
          height: 130,
          color: Colors.green,
          child: StickyHeader(
            header: Container(
              height: 30,
              child: Text('已关注类别'),
            ),
            content: Container(
              //padding: EdgeInsets.only(top: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/images/userImage.png',
                    width: 50,
                    height: 100,
                  ),
                  SizedBox(height: 5),
                  Text('Warframe'),
                ],
              ),
            ),
          ),
        ),
      ],
    );*/
