import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:miniproject1/pages/product/widgets/bottom_navbar.dart';
import 'package:miniproject1/pages/product/widgets/home_page.dart';
import 'package:miniproject1/pages/profile/setting_screen.dart';
import '../../bloc/product/prod_bloc.dart';
import '../../bloc/product/prod_event.dart';
import '../../services/product/repo.dart';
import '../cart/cart_page.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    CartPage(),
    SettingsScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool showAppBar = _selectedIndex == 0;

    return MultiBlocProvider(
      providers: [
        BlocProvider<ProdBloc>(
          create: (BuildContext context) => ProdBloc(Repo())..add(LoadEvent()),
        ),
      ],
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: showAppBar
            ? AppBar(
                automaticallyImplyLeading: false, // Hide the back button
                backgroundColor: Color.fromRGBO(30, 126, 212, 1),
                elevation: 0,
                title: Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search...',
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.search, color: Colors.grey),
                    ),
                  ),
                ),
                actions: [
                  IconButton(
                    icon: Icon(Icons.notifications),
                    color: Colors.white,
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.shopping_cart),
                    color: Colors.white,
                    onPressed: () {
                      context.push('/cart');
                    },
                  ),
                ],
              )
            : null,
        body: _widgetOptions.elementAt(_selectedIndex),
        bottomNavigationBar: BottomNavBar(
          selectedIndex: _selectedIndex,
          onItemTapped: _onItemTapped,
        ),
      ),
    );
  }
}
