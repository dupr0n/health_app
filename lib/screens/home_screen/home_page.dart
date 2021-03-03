import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../data/user_data.dart';
import '../../data_model/user_data_model.dart';
import '../../routes/router.gr.dart';
import 'health_chart.dart';

class HomePage extends StatelessWidget {
  final userData = UserDataModel.fromJson(userJson);
  @override
  Widget build(BuildContext context) {
    final days = DateTime.now().difference(userData.last_active).inDays;
    return Scaffold(
      backgroundColor: const Color(0xFFFBF7FF),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
        child: Column(
          children: [
            Expanded(
              flex: 5,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [BoxShadow(offset: Offset(0.5, 0.5), color: Colors.grey)],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      flex: 2,
                      child: SizedBox(
                        width: 200,
                        height: 50,
                        child: ListTile(
                          dense: true,
                          visualDensity: VisualDensity.compact,
                          leading: Image.asset('assets/images/user.png'),
                          title: Text(
                            userData.getName(),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          subtitle: Text(
                            userData.getId(),
                            style: const TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                    if (MediaQuery.of(context).orientation == Orientation.landscape)
                      Expanded(
                        flex: 2,
                        child: Row(
                          children: [
                            const Text(
                              'Last active ',
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                            Text(
                              '$days day${days > 1 ? 's' : ''} ago',
                              style:
                                  TextStyle(fontWeight: FontWeight.bold, color: Colors.purple[700]),
                            ),
                          ],
                        ),
                      ),
                    if (MediaQuery.of(context).orientation == Orientation.portrait)
                      Expanded(
                        flex: 2,
                        child: Column(
                          children: [
                            const Text('Last Active: '),
                            Text(days.toString()),
                            if (days == 1) const Text(' day ago'),
                            if (days > 1) const Text(' days ago'),
                          ],
                        ),
                      ),
                    const Spacer(),
                    Expanded(
                      child: Image.asset('assets/images/profile.png'),
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(flex: 2),
            Expanded(flex: 22, child: HealthChart(userData: userData)),
            const Spacer(),
            Expanded(
              flex: 2,
              child: Stack(
                alignment: AlignmentDirectional.center,
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(),
                      FlatButton(
                        onPressed: () async {
                          await GoogleSignIn().signOut();
                          await FirebaseAuth.instance.signOut();
                          ExtendedNavigator.of(context).replace(Routes.splashScreen);
                        },
                        child: Row(
                          children: const [
                            Text(
                              'Back',
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                            SizedBox(width: 10),
                            Icon(Icons.exit_to_app_rounded),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.chevron_left, size: 30),
                      SizedBox(width: 10),
                      Icon(Icons.chevron_right, size: 30),
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
