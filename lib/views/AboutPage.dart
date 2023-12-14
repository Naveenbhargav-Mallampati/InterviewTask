import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:interview/Controller.dart';

class AboutPage extends ConsumerWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool disabled = ref.watch(disableProvider);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 50.0),
              child: const Text("Tell us about YourSelf?",
                  style:
                      TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500)),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20.0),
              child: Timer(),
            ),
            SizedBox(
              height: 200, //     <-- TextField expands to this height.
              child: TextField(
                enabled: !disabled,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "You can start here."),
                maxLines: null, // Set this
                expands: true, // and this
                keyboardType: TextInputType.multiline,
              ),
            ),
            const SizedBox(
              height: 50.0,
            ),
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: disabled
                        ? const MaterialStatePropertyAll(Colors.green)
                        : const MaterialStatePropertyAll(Colors.grey)),
                onPressed: () {
                  print("Over");
                  Navigator.pop(context);
                  ref.read(disableProvider.notifier).update((state) => false);
                },
                child: const Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
                  child: Text(
                    "Am Done Now :)",
                    style: TextStyle(color: Colors.black, fontSize: 16.0),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}

class Timer extends ConsumerWidget {
  const Timer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TweenAnimationBuilder<Duration>(
        duration: const Duration(seconds: 30),
        tween: Tween(begin: const Duration(seconds: 30), end: Duration.zero),
        onEnd: () {
          print('Timer ended');
          ref.read(disableProvider.notifier).update((state) => true);
        },
        builder: (BuildContext context, Duration value, Widget? child) {
          final seconds = value.inSeconds;
          return Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Text('Time left for you :$seconds',
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                      fontSize: 16)));
        });
  }
}
