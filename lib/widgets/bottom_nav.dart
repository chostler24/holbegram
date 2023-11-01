import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:holbegram/widgets/feed.dart';
import 'package:holbegram/widgets/search.dart';
import 'package:holbegram/widgets/add_image.dart';
import 'package:holbegram/widgets/favorite.dart';
import 'package:holbegram/widgets/profile.dart';

class BottomNav extends StatefulWidget {
    @override
    _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
    int _currentIndex = 0;
    PageController _pageController = PageController();

    @override
    void dispose() {
        _pageController.dispose();
        super.dispose();
    }

    @override
    void initState() {
        super.initState();
        _pageController = PageController();
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            body: PageView(
                controller: _pageController,
                children: <Widget>[
                    Feed(),
                    Search(),
                    AddImage(),
                    Favorite(),
                    Profile(),
                ],
                onPageChanged: (index) {
                    setState(() {
                        _currentIndex = index;
                    });
                },
            ),
            bottomNavigationBar: BottomNavyBar(
                selectedIndex: _currentIndex,
                showElevation: true,
                itemCornerRadius: 8,
                curve: Curves.easeInBack,
                onItemSelected: (index) {
                    setState(() {
                        _currentIndex = index;
                        _pageController.animateToPage(index,
                                duration: Duration(milliseconds: 300), curve: Curves.ease);
                    });
                },
                items: <BottomNavyBarItem>[
                    BottomNavyBarItem(
                        icon: Icon(Icons.home),
                        title: Text(
                            'Home',
                            style: TextStyle(
                                fontSize: 25,
                                fontFamily: 'Billabong',
                                fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                        ),
                        activeColor: Colors.red,
                        inactiveColor: Colors.black,
                    ),
                    BottomNavyBarItem(
                        icon: Icon(Icons.search),
                        title: Text(
                            'Search',
                            style: TextStyle(
                                fontSize: 25,
                                fontFamily: 'Billabong',
                                fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                        ),
                        activeColor: Colors.red,
                        inactiveColor: Colors.black,
                    ),
                    BottomNavyBarItem(
                        icon: Icon(Icons.add),
                        title: Text(
                            'Add',
                            style: TextStyle(
                                fontSize: 25,
                                fontFamily: 'Billabong',
                                fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                        ),
                        activeColor: Colors.red,
                        inactiveColor: Colors.black,
                    ),
                    BottomNavyBarItem(
                        icon: Icon(Icons.favorite),
                        title: Text(
                            'Favorite',
                            style: TextStyle(
                                fontSize: 25,
                                fontFamily: 'Billabong',
                                fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                        ),
                        activeColor: Colors.red,
                        inactiveColor: Colors.black,
                    ),
                    BottomNavyBarItem(
                        icon: Icon(Icons.person),
                        title: Text(
                            'Profile',
                            style: TextStyle(
                                fontSize: 25,
                                fontFamily: 'Billabong',
                                fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                        ),
                        activeColor: Colors.red,
                        inactiveColor: Colors.black,
                    ),
                ],
            ),
        );
    }
}
