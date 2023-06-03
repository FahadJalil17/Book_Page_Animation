import 'dart:math';

import 'package:flutter/material.dart';

import 'book_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _controller = PageController();
  final _notifierScroll = ValueNotifier(0.0);

  void _listener() {
    _notifierScroll.value = _controller.page!;
  }

  @override
  void initState() {
    // TODO: implement initState
    _controller.addListener(_listener);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.removeListener(_listener);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bookHeight = size.height * 0.45;
    final bookWidth = size.width * 0.6;

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
              child: Image.asset(
                bookAppBackground,
                fit: BoxFit.fill,
              )),
          ValueListenableBuilder<double>(
            valueListenable: _notifierScroll,
            builder: (context, value, _) {
              return PageView.builder(
                  itemCount: books.length,
                  controller: _controller,
                  itemBuilder: (context, index) {
                    final book = books[index];
                    final percentage = index - value;
                    final rotation = percentage.clamp(0.0, 1.0);
                    final fixRotation = pow(rotation, 0.35);

                    return Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                              child: Stack(
                                children: [
                                  Container(
                                    height: bookHeight,
                                    width: bookWidth,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.black26,
                                              blurRadius: 20,
                                              offset: Offset(5.0, 5.0),
                                              spreadRadius: 10
                                          )
                                        ]
                                    ),

                                  ),
                                  Transform(
                                      alignment: Alignment.centerLeft,
                                      transform: Matrix4.identity()
                                        ..setEntry(3, 2, 0.002)
                                        ..rotateY(0.8 * fixRotation)
                                        ..translate(-rotation * size.width * 0.8)..scale(1 + rotation),
                                      child: Image.asset(
                                        book.image,
                                        fit: BoxFit.cover,
                                        height: bookHeight,
                                        width: bookWidth,
                                      )),
                                ],
                              )),
                          SizedBox(
                            height: 90,
                          ),

                          Opacity(
                            opacity: 1 - rotation,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  book.title,
                                  style: TextStyle(fontSize: 30),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  "By ${book.author}",
                                  style: TextStyle(fontSize: 20),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  });
            },
          ),
          SizedBox(
            height: kToolbarHeight,
            child: AppBar(
              title: Text(
                "Book App Animation",
                style: TextStyle(color: Colors.black),
              ),
              centerTitle: false,
              elevation: 0,
              leadingWidth: 0,
              backgroundColor: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}