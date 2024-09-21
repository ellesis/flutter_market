import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PageHome extends StatefulWidget {
  const PageHome({super.key});

  @override
  State<PageHome> createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> {
  Widget _appbarWidget() {
    return AppBar(
      title: GestureDetector(
        onTap: () {
          print('clicked tetle and arrow');
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: _appbarWidget(),
      ),
      body: Center(
        child: Text('Home'),
      ),
    );
  }
}
