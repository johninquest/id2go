import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../style/colors.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'PockID',
          style: TextStyle(
              color: primaryColor,
              letterSpacing: 1.0,
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                margin:
                    const EdgeInsets.only(bottom: 13.0, left: 8.0, right: 8.0),
                child: const Text('Pocket your IDs, unlock your freedom!',
                    /* 'Pocket your ID numbers, unlock your freedom!', */
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        wordSpacing: 5.0,
                        letterSpacing: 1.0,
                        color: primaryColor))),
            const SizedBox(
              height: 13.0,
            ),
            /*  ElevatedButton(
              onPressed: () => log('Tapped google button'),
              child: const Text(
                'Continue with Google',
              ),
            ),
            const SizedBox(
              height: 13.0,
            ), */
            SizedBox(
              // width: MediaQuery.of(context).size.width * 0.5,
              height: MediaQuery.of(context).size.height * 0.08,
              child: ElevatedButton(
                onPressed: () => context.go('/home'),
                // child: const Icon(Icons.home),
                child: const Text(
                  'START',
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
