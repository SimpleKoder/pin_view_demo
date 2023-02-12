import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pin View"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                OtpBox(),
                SizedBox(width: 10),
                OtpBox(),
                SizedBox(width: 10),
                OtpBox(),
                SizedBox(width: 10),
                OtpBox(),
              ],
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {},
              child: const Text("Submit"),
            )
          ],
        ),
      ),
    );
  }
}

class OtpBox extends StatelessWidget {
  const OtpBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    int count = 0;
    return SizedBox(
      height: 50,
      width: 50,
      child: RawKeyboardListener(
        focusNode: FocusNode(canRequestFocus: false),
        onKey: (value) {
          const backspace = LogicalKeyboardKey.backspace;
          if (value.isKeyPressed(backspace)) {
            if (count > 0) {
              FocusScope.of(context).previousFocus();
              count = 0;
              return;
            }
            count++;
          }
        },
        child: TextField(
          maxLength: 1,
          onChanged: (value) {
            if (value.isNotEmpty) {
              FocusScope.of(context).nextFocus();
              count = 0;
            }
          },
          textAlign: TextAlign.center,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          decoration: const InputDecoration(
              counterText: '', border: OutlineInputBorder()),
        ),
      ),
    );
  }
}
