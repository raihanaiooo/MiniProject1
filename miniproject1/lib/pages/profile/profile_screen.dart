import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/profile_bloc/profile_bloc.dart';


class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF1E7ED4),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        title: Text(
          'Profile',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {
              //onPressed logic
            },
            child: Text(
              'Save',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
      body: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          if (state is ProfileLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is ProfileLoaded) {
            return Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Stack(
                      children: [
                        Container(
                          height: size.height * 0.3,
                          width: size.width,
                          color: Color(0xFF1E7ED4),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(height: 40),
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  CircleAvatar(
                                    radius: 50,
                                    backgroundColor: Colors.grey.shade200,
                                    child: Icon(
                                      Icons.person,
                                      size: 50,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 5,
                                    right: 0,
                                    child: Container(
                                      height: 30,
                                      width: 30,
                                      decoration: BoxDecoration(
                                        color: Colors.blue,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Icon(
                                        Icons.camera_alt_outlined,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 20),
                              Text(
                                '${state.profile.firstname} ${state.profile.lastname}',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: size.height * 0.25),
                          width: size.width,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 20),
                                Text('Username'),
                                TextField(
                                  decoration: InputDecoration(
                                    border: UnderlineInputBorder(),
                                  ),
                                  controller: TextEditingController(
                                    text: state.profile.username,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text('Email Address'),
                                TextField(
                                  decoration: InputDecoration(
                                    border: UnderlineInputBorder(),
                                  ),
                                  controller: TextEditingController(
                                    text: state.profile.email,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text('Phone'),
                                TextField(
                                  decoration: InputDecoration(
                                    border: UnderlineInputBorder(),
                                  ),
                                  controller: TextEditingController(
                                    text: state.profile.phone,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text('Address'),
                                TextField(
                                  decoration: InputDecoration(
                                    border: UnderlineInputBorder(),
                                  ),
                                  controller: TextEditingController(
                                    text:
                                        '${state.profile.address.street}, ${state.profile.address.city}',
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text('Geolocation'),
                                TextField(
                                  decoration: InputDecoration(
                                    border: UnderlineInputBorder(),
                                  ),
                                  controller: TextEditingController(
                                    text:
                                        'Lat: ${state.profile.address.geolocation.lat}, Long: ${state.profile.address.geolocation.long}',
                                  ),
                                ),
                                SizedBox(height: 10),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(279, 52),
                      backgroundColor: Color(0xFF1E7ED4),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    onPressed: () {
                      // Implementasi fungsi Logout
                    },
                    child: Text(
                      'UBAH DATA DIRI',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
              ],
            );
          } else if (state is ProfileError) {
            return Center(child: Text(state.message));
          }
          return Center(child: Text('Please wait...'));
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            label: 'Applications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_outlined),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}