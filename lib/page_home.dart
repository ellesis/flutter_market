import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PageHome extends StatefulWidget {
  const PageHome({super.key});

  @override
  State<PageHome> createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> {
  List<Map<String, String>> data = [];
  late int _currentPageIndex;

  @override
  void initState() {
    super.initState();
    _currentPageIndex = 0;
    data = [
      {
        "cid": "1",
        "image": "assets/images/ara-1.jpg",
        "title": "Shoes275",
        "location": "Palo Alto, CA",
        "price": "30",
        "likes": "2"
      },
      {
        "cid": "2",
        "image": "assets/images/ara-2.jpg",
        "title": "LA Lib 5kg",
        "location": "Palo Alto, CA",
        "price": "100",
        "likes": "5"
      },
      {
        "cid": "3",
        "image": "assets/images/ara-3.jpg",
        "title": "Toothpaste",
        "location": "Palo Alto, CA",
        "price": "5",
        "likes": "0"
      },
      {
        "cid": "4",
        "image": "assets/images/ara-4.jpg",
        "title": "[Full Box] MacBook Pro 16-inch TouchBar Space Gray",
        "location": "Palo Alto, CA",
        "price": "2500",
        "likes": "6"
      },
      {
        "cid": "5",
        "image": "assets/images/ara-5.jpg",
        "title": "Drill",
        "location": "Palo Alto, CA",
        "price": "150",
        "likes": "2"
      },
      {
        "cid": "6",
        "image": "assets/images/ara-6.jpg",
        "title": "Galaxy s10",
        "location": "Palo Alto, CA",
        "price": "180",
        "likes": "2"
      },
      {
        "cid": "7",
        "image": "assets/images/ara-7.jpg",
        "title": "shelf",
        "location": "Palo Alto, CA",
        "price": "15",
        "likes": "2"
      },
      {
        "cid": "8",
        "image": "assets/images/ara-8.jpg",
        "title": "Refrigerated Showcase",
        "location": "Palo Alto, CA",
        "price": "80",
        "likes": "3"
      },
      {
        "cid": "9",
        "image": "assets/images/ara-9.jpg",
        "title": "Daewoo Mini Refrigerator",
        "location": "Palo Alto, CA",
        "price": "30",
        "likes": "3"
      },
      {
        "cid": "10",
        "image": "assets/images/ara-10.jpg",
        "title": "Melkins Pull-up Bar for Sale",
        "location": "Palo Alto, CA",
        "price": "50",
        "likes": "7"
      },
    ];
  }

  Widget _appbarWidget() {
    return AppBar(
      title: GestureDetector(
        onTap: () {
          print('clicked title and arrow');
        },
        child: const Row(
          children: [
            Text('Home'),
            Icon(Icons.arrow_drop_down),
          ],
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.search),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.tune),
        ),
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            "assets/svg/bell.svg",
            width: 22,
            height: 22,
          ),
        ),
      ],
    );
  }

  Widget _bodyWidget() {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      itemCount: 10,
      separatorBuilder: (BuildContext context, int index) {
        return Container(
          height: 1,
          color: Colors.grey,
        );
      },
      itemBuilder: (BuildContext context, int index) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                child: Image.asset(
                  data[index]["image"] ?? '',
                  width: 100,
                  height: 100,
                ),
              ),
              Expanded(
                child: Container(
                  height: 100,
                  padding: const EdgeInsets.only(left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data[index]["title"] ?? '',
                        style: TextStyle(fontSize: 15),
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        data[index]["location"] ?? '',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black.withOpacity(0.3),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        data[index]["price"] ?? '',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 5),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            SvgPicture.asset(
                              "assets/svg/heart_off.svg",
                              width: 13,
                              height: 13,
                            ),
                            Text(data[index]["likes"] ?? ''),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  BottomNavigationBarItem _bottomNavigationBarItem(String iconName, String label) {
    return BottomNavigationBarItem(
      icon: SvgPicture.asset("assets/svg/${iconName}_off.svg", width: 22, height: 22),
      label: label,
    );
  }

  Widget _bottomNavigationBarWidget() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      onTap: (int index) {
        setState(() {
          _currentPageIndex = index;
        });
      },
      currentIndex: _currentPageIndex,
      items: [
        _bottomNavigationBarItem("home", "Home"),
        _bottomNavigationBarItem("notes", "Neighborhood"),
        _bottomNavigationBarItem("location", "My Area"),
        _bottomNavigationBarItem("chat", "Chating"),
        _bottomNavigationBarItem("user", "My Items"),
      ],
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.grey,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: _appbarWidget(),
      ),
      body: _bodyWidget(),
      bottomNavigationBar: _bottomNavigationBarWidget(),
    );
  }
}
