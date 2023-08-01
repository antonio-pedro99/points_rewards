import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:points_rewards/colors.dart';
import 'package:points_rewards/extensions/navigation.dart';
import 'package:points_rewards/extensions/system.dart';
import 'package:points_rewards/theme.dart';
import 'package:points_rewards/widgets/button.dart';
import 'package:points_rewards/widgets/custom_card.dart';
import 'package:points_rewards/widgets/headline.dart';
import 'package:points_rewards/widgets/texture_background.dart';

class InductionApp extends StatelessWidget {
  const InductionApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Points Rewards',
      theme: InductionAppTheme.dark,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController rollNumberTextEditingController =
      TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: SizedBox(
            child: Image.asset("assets/iiitd.png", height: 200),
          ),
          centerTitle: true,
          leading: const SizedBox(
            width: 50,
          ),
          actions: const [
            SizedBox(
              width: 50,
            ),
          ],
        ),
        body: SafeArea(
          child: Stack(
            children: [
              const TextureBackground(),
              Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const SizedBox(
                            height: kToolbarHeight,
                          ),
                          const SizedBox(
                            height: 200,
                            child: Image(
                              image: AssetImage('assets/logo.png'),
                            ),
                          ),
                          const SizedBox(
                            height: kToolbarHeight,
                          ),
                          CascadeCard(
                            child: Form(
                              key: formKey,
                              child: Column(
                                children: [
                                  TextFormField(
                                    controller: rollNumberTextEditingController,
                                    textAlign: TextAlign.center,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Please enter user's username";
                                      }
                                      return null;
                                    },
                                    decoration: const InputDecoration(
                                      filled: false,
                                      hintText: "Enter username here",
                                      alignLabelWithHint: true,
                                      floatingLabelAlignment:
                                          FloatingLabelAlignment.center,
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.always,
                                      labelStyle: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontFamily: 'Netflix Sans ',
                                        fontWeight: FontWeight.w700,
                                        letterSpacing: -0.64,
                                      ),
                                      hintStyle: TextStyle(
                                        color: Color(0xFF585858),
                                        fontSize: 24,
                                        fontFamily: 'Netflix Sans ',
                                        fontWeight: FontWeight.w700,
                                        letterSpacing: -0.96,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      if (formKey.currentState!.validate()) {
                                        context.push(PointRewardPage(
                                            username:
                                                rollNumberTextEditingController
                                                    .text));
                                      }
                                      rollNumberTextEditingController.clear();
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: InductionAppColor.yellow,
                                    ),
                                    child: const Text('Continue'),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )),
            ],
          ),
        ));
  }
}

class PointRewardPage extends StatefulWidget {
  const PointRewardPage({super.key, required this.username});
  final String username;

  @override
  State<PointRewardPage> createState() => _PointRewardPageState();
}

class _PointRewardPageState extends State<PointRewardPage> {

  int max = 15;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: SizedBox(
            child: Image.asset("assets/iiitd.png", height: 200),
          ),
          centerTitle: true,
          leading: const SizedBox(
            width: 50,
          ),
          actions: const [
            SizedBox(
              width: 50,
            ),
          ],
        ),
        body: SafeArea(
          child: Stack(
            children: [
              const TextureBackground(),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.all(18),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: kToolbarHeight,
                      ),
                      const SizedBox(
                        height: 200,
                        child: Image(
                          image: AssetImage('assets/logo.png'),
                        ),
                      ),
                      const SizedBox(
                        height: kToolbarHeight,
                      ),
                      StreamBuilder(
                        stream: FirebaseFirestore.instance
                            .collection('users')
                            .where("username",
                                isEqualTo: widget.username.toLowerCase().trim())
                            .snapshots(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            final List<DocumentSnapshot> documents =
                                snapshot.data!.docs;
                            if (documents.isEmpty) {
                              return Column(
                                children: [
                                  Image.asset("assets/vector.png", height: 150),
                                  const Text("User not found",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontFamily: 'Netflix Sans ',
                                        fontWeight: FontWeight.w700,
                                        letterSpacing: -0.64,
                                      )),
                                  const SizedBox(
                                    height: 24,
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      context.pop();
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: InductionAppColor.yellow,
                                    ),
                                    child: const Text('Go Back'),
                                  )
                                ],
                              );
                            }
                            final DocumentSnapshot document = documents.first;
                            return Column(
                              children: [
                                Stack(
                                  children: [
                                    HeadlineText(
                                        text: document['points'].toString()),
                                    Align(
                                      alignment: Alignment.topRight,
                                      child: Container(
                                          padding: const EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                            color: Colors.black,
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          child: Text(
                                            document['username'],
                                            style: TextStyle(
                                              color: InductionAppColor.yellow,
                                              fontSize: 16,
                                              fontFamily: 'Netflix Sans ',
                                              fontWeight: FontWeight.w700,
                                              letterSpacing: -0.64,
                                            ),
                                          )),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 24,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    PointsButton(
                                        icon: Icons.remove,
                                        onPressed: () {
                                          FirebaseFirestore.instance
                                              .collection('users')
                                              .where("username",
                                                  isEqualTo: widget.username
                                                      .toLowerCase()
                                                      .trim())
                                              .get()
                                              .then((value) {
                                            final List<DocumentSnapshot>
                                                documents = value.docs;
                                            if (documents.isNotEmpty) {
                                              final DocumentSnapshot document =
                                                  documents.first;

                                              if (document['points'] > 0) {
                                                FirebaseFirestore.instance
                                                    .collection('users')
                                                    .doc(document.id)
                                                    .update({
                                                  'points':
                                                      document['points'] - 5
                                                });
                                              } else {
                                                context.showSnackBar(
                                                    "User has no points");
                                              }
                                            }
                                          });
                                        }),
                                    Container(
                                      width: 172.24,
                                      height: 53.66,
                                      decoration: ShapeDecoration(
                                        color: InductionAppColor.darkGrey,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(7.52),
                                        ),
                                      ),
                                      child: const Center(
                                        child: Text(
                                          'points',
                                          style: TextStyle(
                                            color: Color(0xFF585858),
                                            fontSize: 29.14,
                                            fontFamily: 'Netflix Sans ',
                                            fontWeight: FontWeight.w700,
                                            letterSpacing: -1.17,
                                          ),
                                        ),
                                      ),
                                    ),
                                    PointsButton(
                                        icon: Icons.add,
                                        onPressed: () {
                                          FirebaseFirestore.instance
                                              .collection('users')
                                              .where("username",
                                                  isEqualTo: widget.username
                                                      .toLowerCase()
                                                      .trim())
                                              .get()
                                              .then((value) {
                                            final List<DocumentSnapshot>
                                                documents = value.docs;
                                            if (documents.isNotEmpty) {
                                              final DocumentSnapshot document =
                                                  documents.first;

                                              int currentToAdd = 5;

                                              if (currentToAdd < max) {
                                                FirebaseFirestore.instance
                                                    .collection('users')
                                                    .doc(document.id)
                                                    .update({
                                                  'points':
                                                      document['points'] + 5
                                                });
                                              setState(() {
                                                currentToAdd += 5;
                                              });
                                              } else {
                                                context.showSnackBar(
                                                    "You can only reward a maximum of $max points per time");
                                              }
                                            }
                                          });
                                        }),
                                  ],
                                ),

                                const SizedBox(
                                  height: 24,
                                ),

                                ElevatedButton(
                                    onPressed: ()=> context.pop(),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: InductionAppColor.yellow,
                                    ),
                                    child: const Text('Continue'),
                                  )
                              ],
                            );
                          } else if (snapshot.hasError) {
                            return Text("${snapshot.error}");
                          }
                          return const CircularProgressIndicator();
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
