import 'package:flutter/material.dart';
import 'package:git/core/phone_namber.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
            width: MediaQuery.of(context).size.width * 0.7,
            child: TextFormField(
              controller: SendCode.phoneController,
              decoration: const InputDecoration(
                  hintText: "Phone Number",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  )),
            ),
          ),
          ElevatedButton(
            child: Text("Next"),
            onPressed: () {
              SendCode.sendSms(context);
            },
          ),
        ],
      ),
    );
  }
}
