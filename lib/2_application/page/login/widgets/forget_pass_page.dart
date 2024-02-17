import 'package:flutter/material.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.security_update_warning_outlined,
              size: 40,
              color: Colors.red,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'It is your own responsibility to remember your password!',
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
