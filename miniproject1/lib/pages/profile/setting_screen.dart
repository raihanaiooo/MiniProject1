import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:miniproject1/pages/profile/profile_screen.dart';
import 'package:miniproject1/services/profile/profile_service.dart';

import '../../bloc/profile/profile_bloc.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) =>
          ProfileBloc(ProfileService())..add(LoadProfileEvent()),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF1E7ED4),
          title: const Text(
            'Akun',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                height: size.height * 0.3,
                width: size.width,
                color: const Color(0xFF1E7ED4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.grey.shade200,
                      child: const Icon(
                        Icons.person,
                        size: 50,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'John Doe',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: size.height * 0.18),
                width: size.width,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 30),
                    ListView(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        ListTile(
                          title: const Text('Profile'),
                          trailing: const Icon(Icons.chevron_right),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProfileScreen(),
                              ),
                            );
                          },
                        ),
                        const Divider(),
                        ListTile(
                          title: const Text('Address'),
                          trailing: const Icon(Icons.chevron_right),
                          onTap: () {
                            // Implementasi halaman Address
                          },
                        ),
                        const Divider(),
                        ListTile(
                          title: const Text('Tentang'),
                          trailing: const Icon(Icons.chevron_right),
                          onTap: () {
                            // Implementasi halaman Tentang
                          },
                        ),
                        const Divider(),
                        ListTile(
                          title: const Text('Settings'),
                          trailing: const Icon(Icons.chevron_right),
                          onTap: () {
                            // Implementasi halaman Settings
                          },
                        ),
                        const Divider(),
                        ListTile(
                          title: const Text('FAQ'),
                          trailing: const Icon(Icons.chevron_right),
                          onTap: () {
                            // Implementasi halaman FAQ
                          },
                        ),
                        const Divider(),
                      ],
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
        // bottomNavigationBar: null,
      ),
    );
  }
}
