import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:interview/Controller.dart';
import 'package:interview/views/AboutPage.dart';

class MainPage extends ConsumerWidget {
  final List<Widget> _tabs = [
    const CertificateTab(),
    const ProfileTab(),
    const ChatTab(),
    const ScoreTab(),
  ];

  MainPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text('Main Page'),
      ),
      body: Consumer(
        builder: (context, watch, child) {
          return IndexedStack(
            index:
                watch.watch(bottomIndex), // Index 1 represents the ProfileTab
            children: _tabs,
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.black,
        currentIndex:
            ref.watch(bottomIndex), // Index 1 represents the ProfileTab
        items: const [
          BottomNavigationBarItem(
            backgroundColor: Colors.deepPurple,
            icon: Icon(Icons.verified),
            label: 'Certificate',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.deepPurple,
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.deepPurple,
            icon: Icon(Icons.chat),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.deepPurple,
            icon: Icon(Icons.score),
            label: 'Score',
          ),
        ],
        onTap: (index) {
          ref.read(bottomIndex.notifier).update((state) => index);
        },
      ),
    );
  }
}

class CertificateTab extends StatelessWidget {
  const CertificateTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Certificate Tab'),
    );
  }
}

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: ProfileView(),
    );
  }
}

class ChatTab extends StatelessWidget {
  const ChatTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Chat Tab'),
    );
  }
}

class ScoreTab extends StatelessWidget {
  const ScoreTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Score Tab'),
    );
  }
}

class ProfileView extends ConsumerWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return (Container(
      child: Center(
        child: ElevatedButton(
            style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.green)),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const AboutPage();
              }));
            },
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
              child: Text(
                "win Certificate :)",
                style: TextStyle(color: Colors.black, fontSize: 16.0),
              ),
            )),
      ),
    ));
  }
}
