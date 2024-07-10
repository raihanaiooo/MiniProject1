import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:miniproject1/bloc/prod_bloc.dart';
import 'package:miniproject1/bloc/prod_event.dart';
import 'package:miniproject1/bloc/prod_state.dart';
import 'package:miniproject1/model/model.dart';
import 'package:miniproject1/service/repo.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    CartPage(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProdBloc>(
          create: (BuildContext context) => ProdBloc(Repo())..add(LoadEvent()),
        )
      ],
      child: Scaffold(
        backgroundColor: Colors.white,
        extendBodyBehindAppBar: true, // Extend body behind app bar
        appBar: AppBar(
          backgroundColor:
              Colors.transparent, // Set app bar background to transparent
          elevation: 0, // No shadow
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
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.notifications),
              color: Colors.white,
              onPressed: () {
                // Handle notification action
              },
            ),
            IconButton(
              icon: Icon(Icons.shopping_cart),
              color: Colors.white,
              onPressed: () {
                // Handle cart action
              },
            ),
          ],
        ),
        body: _widgetOptions.elementAt(_selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Color.fromRGBO(30, 126, 212, 1),
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProdBloc(Repo())..add(LoadEvent()),
      child: BlocBuilder<ProdBloc, ProdState>(
        builder: (context, state) {
          if (state is Loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is Error) {
            return Center(child: Text("Error: ${state.error}"));
          }
          if (state is Loaded) {
            List<Model> prodList = state.models;
            return CustomScrollView(
              slivers: <Widget>[
                SliverAppBar(
                  backgroundColor: Colors.transparent,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Stack(
                      children: [
                        Positioned.fill(
                          child: Container(
                            decoration: BoxDecoration(color: Colors.white),
                          ),
                        ),
                        Positioned(
                          top: -200,
                          bottom: 0,
                          left: -15,
                          child: Container(
                            width: 350,
                            height: 200,
                            decoration: BoxDecoration(
                              color: Colors.blueAccent,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: BalanceBox(),
                ),
                SliverPadding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.0, vertical: 0.0),
                  sliver: SliverGrid.count(
                    crossAxisCount: 4,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 0.75,
                    children: [
                      CategoryBox(
                        categoryName: 'Category 1',
                        categoryIcon: Icons.category,
                      ),
                      CategoryBox(
                        categoryName: 'Category 2',
                        categoryIcon: Icons.category,
                      ),
                      CategoryBox(
                        categoryName: 'Category 3',
                        categoryIcon: Icons.category,
                      ),
                      CategoryBox(
                        categoryName: 'Category 4',
                        categoryIcon: Icons.category,
                      ),
                    ],
                  ),
                ),
                SliverGrid(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 0.75,
                  ),
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return Container(
                        width: 140,
                        height: 190,
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          color: Colors.white,
                          elevation: 4,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.vertical(
                                  top: Radius.circular(10),
                                ),
                                child: Container(
                                  width: double.infinity,
                                  height: 90,
                                  child: Image.network(
                                    prodList[index].image ?? '',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 6,
                                  horizontal: 10,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${prodList[index].title}',
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w300,
                                        fontSize: 8,
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      '\$${prodList[index].price}',
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Spacer(),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 15,
                                  horizontal: 10,
                                ),
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.star,
                                      color: Colors.yellow,
                                      size: 8,
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      '${prodList[index].rating?.rate}',
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 8,
                                      ),
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      '(${prodList[index].rating?.count}) sold',
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w300,
                                        fontSize: 8,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    childCount: prodList.length,
                  ),
                ),
              ],
            );
          }
          return Container();
        },
      ),
    );
  }
}

class CategoryBox extends StatelessWidget {
  final String categoryName;
  final IconData categoryIcon;

  const CategoryBox({
    Key? key,
    required this.categoryName,
    required this.categoryIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 6,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min, // Set mainAxisSize to min
        children: [
          Icon(categoryIcon, size: 15),
          SizedBox(height: 8),
          Text(
            categoryName,
            style: TextStyle(fontSize: 8, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class BalanceBox extends StatelessWidget {
  const BalanceBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8, // Mengurangi lebar box
        padding: const EdgeInsets.symmetric(
            horizontal: 8.0, vertical: 5.0), // Mengurangi padding horizontal
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 6,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 8.0), // Padding kiri untuk balance
              child: Row(
                children: [
                  Icon(Icons.attach_money,
                      size: 24, color: Color.fromRGBO(30, 126, 212, 1)),
                  SizedBox(width: 2), // Mengurangi jarak antara ikon dan teks
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '1,000',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(30, 126, 212, 1),
                        ),
                      ),
                      SizedBox(height: 2), // Mengurangi jarak antara teks
                      Text(
                        'Top Up',
                        style: TextStyle(
                          fontSize: 8,
                          fontWeight: FontWeight.w300,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  right: 8.0), // Padding kanan untuk voucher
              child: Row(
                children: [
                  Icon(Icons.card_giftcard,
                      size: 24, color: Color.fromRGBO(30, 126, 212, 1)),
                  SizedBox(width: 2), // Mengurangi jarak antara ikon dan teks
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'My Voucher',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(30, 126, 212, 1),
                        ),
                      ),
                      SizedBox(height: 2), // Mengurangi jarak antara teks
                      Text(
                        '8 new vouchers',
                        style: TextStyle(
                          fontSize: 8,
                          fontWeight: FontWeight.w300,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Cart Page',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Profile Page',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}
