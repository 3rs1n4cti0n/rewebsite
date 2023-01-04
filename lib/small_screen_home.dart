// ignore_for_file: camel_case_types

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;
import 'package:http/http.dart' as http;

class smallScreen extends StatefulWidget {
  const smallScreen({super.key});

  @override
  State<smallScreen> createState() => _smallScreenState();
}

class _smallScreenState extends State<smallScreen> {
  Gradient gradient =
      const LinearGradient(colors: [Colors.red, Colors.green, Colors.blue]);
  String namE = "";
  String emaiL = "";
  String subjecT = "";
  String messagE = "";
  final ScrollController _scrollController = ScrollController();
  bool emailSent = false;
  String feedback = "";
  double pixels = 0;
  String error = "";

  @override
  void initState() {
    _scrollController.addListener(() {
      pixels = _scrollController.position.pixels;
      setState(() {});
    });
    super.initState();
  }

  setname(String name) {
    namE = name;
  }

  setemail(String email) {
    emaiL = email;
  }

  setsubject(String subject) {
    subjecT = subject;
  }

  setmessage(String message) {
    messagE = message;
  }

  Future sendMail(
      {required String name,
      required String email,
      required String subject,
      required String message}) async {
    final url = Uri.parse("https://api.emailjs.com/api/v1.0/email/send");
    var serviceId = 'service_kewp9vi';
    var templateId = 'template_9vtved7';
    var userId = 'HX_3iIcb8eoMHTHeb';
    final response = await http.post(url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode({
          'service_id': serviceId,
          'template_id': templateId,
          'user_id': userId,
          'template_params': {
            'user_subject': subject,
            'from_name': name,
            'user_email': email,
            'message': message
          }
        }));
    feedback = response.body.toString() == "OK"
        ? "Email has been sent!"
        : "There was an error!";
  }

  AppBar appBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      leadingWidth: 800,
      toolbarHeight: 40,
      leading: Row(
        children: const [
          Text(
            "Ersan Tzampaz Chatip",
            maxLines: 1,
            overflow: TextOverflow.visible,
            style: TextStyle(color: Colors.white),
          )
        ],
      ),
      elevation: 0,
      actions: [
        TextButton(
          onPressed: (() {
            _scrollController
                .animateTo(_scrollController.position.maxScrollExtent,
                    duration: const Duration(milliseconds: 600),
                    curve: Curves.linear)
                .then((value) {
              _scrollController.animateTo(
                  _scrollController.position.maxScrollExtent,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.linear);
            });
          }),
          child: const Text(
            "Contact Me",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: appBar(),
      body: ListView(
        controller: _scrollController,
        padding: EdgeInsets.zero,
        children: [
          const SizedBox(
            height: 100,
          ),
          Stack(
            children: [
              SizedBox(
                height: 600,
                child: Stack(children: [
                  Positioned.fill(
                    child: Image.asset(
                      "aboutme.jpg",
                      fit: BoxFit.cover,
                      color: Colors.black,
                      colorBlendMode: BlendMode.saturation,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        gradient: LinearGradient(
                          begin: FractionalOffset.topCenter,
                          end: FractionalOffset.bottomCenter,
                          colors: [
                            Colors.black.withOpacity(0.25),
                            Colors.black,
                          ],
                        )),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        gradient: LinearGradient(
                          begin: FractionalOffset.bottomCenter,
                          end: FractionalOffset.topCenter,
                          colors: [
                            Colors.black.withOpacity(0.25),
                            Colors.black,
                          ],
                        )),
                  ),
                ]),
              ),
              Container(
                height: 600,
                width: width,
                decoration: const BoxDecoration(
                    color: Colors.red, backgroundBlendMode: BlendMode.overlay),
                child: Stack(
                  children: [
                    AnimatedPositioned(
                      duration: const Duration(milliseconds: 600),
                      right: pixels >= 25 ? 0 : width,
                      curve: Curves.easeIn,
                      child: SizedBox(
                        height: 600,
                        width: width,
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: MediaQuery.of(context).size.width > 451
                              ? Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: const [
                                            Flexible(
                                              child: Text(
                                                "ABOUT ME",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 36),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 15,
                                            ),
                                            Text(
                                              "I was born in Greece. Graduated from Computer Science and I enjoy designing products and their architecture.",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 24),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              : Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: const [
                                            Flexible(
                                              child: Text(
                                                "ABOUT ME",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 36),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 15,
                                            ),
                                            Text(
                                              "I was born in Greece. Graduated from Computer Science and I enjoy designing products and their architecture.",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 24),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            color: Colors.black,
            height: 25,
          ),
          Stack(
            children: [
              SizedBox(
                height: 800,
                child: Stack(children: [
                  Positioned.fill(
                    child: Image.asset(
                      "skills.jpg",
                      fit: BoxFit.cover,
                      color: Colors.black,
                      colorBlendMode: BlendMode.saturation,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        gradient: LinearGradient(
                          begin: FractionalOffset.bottomCenter,
                          end: FractionalOffset.topCenter,
                          colors: [
                            Colors.black.withOpacity(0.25),
                            Colors.black,
                          ],
                        )),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        gradient: LinearGradient(
                          begin: FractionalOffset.topCenter,
                          end: FractionalOffset.bottomCenter,
                          colors: [
                            Colors.black.withOpacity(0.25),
                            Colors.black,
                          ],
                        )),
                  ),
                ]),
              ),
              Container(
                height: 800,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: const BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.all(Radius.circular(80)),
                    backgroundBlendMode: BlendMode.overlay),
                child: Stack(
                  children: [
                    AnimatedPositioned(
                      duration: const Duration(milliseconds: 300),
                      top: pixels > 200 ? 0 : height,
                      child: SizedBox(
                        height: 800,
                        width: width - 40,
                        child: Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "SKILLS",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 36),
                              ),
                              GridView(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: width < 1000 ? 2 : 4,
                                        mainAxisExtent: 70,
                                        crossAxisSpacing: 40,
                                        mainAxisSpacing: 40),
                                children: const [
                                  skillContainer(
                                    title: "Flutter",
                                  ),
                                  skillContainer(
                                    title: "UI/UX Design",
                                  ),
                                  skillContainer(
                                    title: "Machine Learning",
                                  ),
                                  skillContainer(
                                    title: "Communication",
                                  ),
                                  skillContainer(
                                    title: "Logo Design",
                                  ),
                                  skillContainer(
                                    title: "Poster Deign",
                                  ),
                                  skillContainer(
                                    title: "Python",
                                  ),
                                  skillContainer(
                                    title: "C#",
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            color: Colors.black,
            height: 25,
          ),
          Stack(
            children: [
              SizedBox(
                height: 900,
                child: Stack(children: [
                  Positioned.fill(
                    child: Image.asset(
                      "work.jpg",
                      fit: BoxFit.cover,
                      color: Colors.black,
                      colorBlendMode: BlendMode.saturation,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        gradient: LinearGradient(
                          begin: FractionalOffset.topCenter,
                          end: FractionalOffset.bottomCenter,
                          colors: [
                            Colors.black.withOpacity(0.25),
                            Colors.black,
                          ],
                        )),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        gradient: LinearGradient(
                          begin: FractionalOffset.bottomCenter,
                          end: FractionalOffset.topCenter,
                          colors: [
                            Colors.black.withOpacity(0.25),
                            Colors.black,
                          ],
                        )),
                  ),
                ]),
              ),
              Container(
                height: 900,
                decoration: const BoxDecoration(
                    color: Colors.blue, backgroundBlendMode: BlendMode.overlay),
                child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          "PORTFOLIO",
                          style: TextStyle(color: Colors.white, fontSize: 36),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        CarouselSlider(
                          options: CarouselOptions(
                              pageSnapping: true,
                              enableInfiniteScroll: false,
                              clipBehavior: Clip.antiAlias,
                              height: 700,
                              viewportFraction: 0.8,
                              enlargeCenterPage: true),
                          items: [
                            if (MediaQuery.of(context).size.width > 800)
                              const CarouselListItemHorizontal(
                                title: "Music Player App UI",
                                description:
                                    "Using Flutter created a music player app UI",
                                imagePath: "music.png",
                                linkPage:
                                    "https://github.com/3rs1n4cti0n/MusicPlayerApp-JDK-17-",
                              ),
                            if (MediaQuery.of(context).size.width < 800)
                              const CarouselListItemVertical(
                                title: "Music Player App UI",
                                description:
                                    "Using Flutter created a music player app UI",
                                imagePath: "music.png",
                                linkPage:
                                    "https://github.com/3rs1n4cti0n/MusicPlayerApp-JDK-17-",
                                shadowColor: Colors.black,
                              ),
                            const CarouselListItemVertical(
                              description:
                                  "Using darts' Flutter framework created the current webpage",
                              imagePath: "website.jpeg",
                              title: "Current Website",
                              linkPage: "ersancambazhatip.web.app",
                              shadowColor: Colors.white,
                            ),
                            const CarouselListItemVertical(
                              description:
                                  "Used Unity Game Engine to create a Pokemon like game. All of the in game assets have been created using PyxelEdit",
                              imagePath: "teras.png",
                              title: "Researchers Of Teras",
                              linkPage:
                                  "https://drive.google.com/file/d/1chqGQ9yE0gSkphp7W5HSDeZgRoBvChX_/view?usp=sharing",
                              shadowColor: Colors.black,
                            ),
                            const CarouselListItemVertical(
                              imagePath: "spam_detection.png",
                              title: "Spam Mail Detection",
                              description:
                                  "Used Python with Numpy, Sklearn, Pandas, Seaborn and matplotlib to create a machine learning algorithm to detect spam e-mails with 98% accuracy and then show the resulting matrix",
                              linkPage:
                                  "https://github.com/3rs1n4cti0n/text-mining-project",
                              shadowColor: Colors.black,
                            ),
                            const CarouselListItemVertical(
                              imagePath: "heart_risk.png",
                              title: "Heart Risk Detection",
                              description:
                                  "Used Python with Sklearn and Pandas to create a machine learning algorithm to detect risk of heart disease with 99% accuracy and then show the resulting matrix",
                              linkPage:
                                  "https://github.com/3rs1n4cti0n/MachineLearningTemplate/tree/featureSelection",
                              shadowColor: Colors.black,
                            ),
                            if (MediaQuery.of(context).size.width > 800)
                              const CarouselListItemHorizontal(
                                  imagePath: "testpro.png",
                                  title: "TestPro Fitness App",
                                  description:
                                      "TestPro is a fitness application created with Flutter that is used to store some data and display it. Used Firebase as backend to keep name, surname, age, weight, height and e-mail.",
                                  linkPage:
                                      "https://github.com/3rs1n4cti0n/TestPro"),
                            if (MediaQuery.of(context).size.width < 800)
                              const CarouselListItemVertical(
                                imagePath: "testpro.png",
                                title: "TestPro Fitness App",
                                description:
                                    "TestPro is a fitness application created with Flutter that is used to store some data and display it. Used Firebase as backend to keep name, surname, age, weight, height and e-mail.",
                                linkPage:
                                    "https://github.com/3rs1n4cti0n/TestPro",
                                shadowColor: Colors.black,
                              ),
                            const CarouselListItemVerticalNoImage(
                                title: "Visual Novel Creator",
                                description:
                                    "Visual novel creator will be a Game Engine to create visual novels without writing any code. Currently has path navigation only.",
                                linkPage:
                                    "https://github.com/3rs1n4cti0n/story_creator"),
                            const CarouselListItemVerticalNoImage(
                                title: "More On Github",
                                description:
                                    "Click the \"Follow Link\" to check the github repository page, where you can follow to get updates on my projects.",
                                linkPage:
                                    "https://github.com/3rs1n4cti0n?tab=repositories")
                          ],
                        ),
                      ],
                    )),
              ),
            ],
          ),
          SizedBox(
            height: 800,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.only(bottom: 50),
                  child: Text(
                    "CONTACT ME",
                    style: TextStyle(color: Colors.white, fontSize: 36),
                  ),
                ),
                Flexible(
                  child: ShaderMask(
                    shaderCallback: (bounds) => gradient
                        .createShader(Rect.fromLTRB(0, 0, width, height)),
                    blendMode: BlendMode.srcIn,
                    child: CustomTextField(
                      width: width,
                      hinttext: "Subject:",
                      onChanged: (p0) {
                        setsubject(p0);
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                Flexible(
                  child: ShaderMask(
                    shaderCallback: (bounds) => gradient
                        .createShader(Rect.fromLTRB(0, 0, width, height)),
                    blendMode: BlendMode.srcIn,
                    child: CustomTextField(
                      width: width,
                      hinttext: "Name:",
                      onChanged: (p0) {
                        setname(p0);
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                Flexible(
                  child: ShaderMask(
                    shaderCallback: (bounds) => gradient
                        .createShader(Rect.fromLTRB(0, 0, width, height)),
                    blendMode: BlendMode.srcIn,
                    child: CustomTextField(
                      width: width,
                      hinttext: "Email:",
                      onChanged: (p0) {
                        setemail(p0);
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                Flexible(
                  child: ShaderMask(
                    shaderCallback: (bounds) => gradient
                        .createShader(Rect.fromLTRB(0, 0, width, height)),
                    blendMode: BlendMode.srcIn,
                    child: CustomTextField(
                      width: width,
                      hinttext: "Message",
                      linecount: 15,
                      onChanged: (p0) {
                        setmessage(p0);
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                ShaderMask(
                  shaderCallback: (bounds) =>
                      gradient.createShader(Rect.fromLTRB(0, 0, width, height)),
                  child: TextButton(
                      onPressed: (() async {
                        RegExp regex = RegExp(
                            r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$");
                        setState(() {
                          emailSent = false;
                        });
                        feedback = "";

                        if (subjecT == "") {
                          feedback += "Please provide a subject title! ";
                        }
                        if (namE == "") {
                          feedback += "Please give a name! ";
                        }
                        if (emaiL != "") {
                          if (!emaiL.contains(regex)) {
                            feedback += "Please enter valid e-mail adress! ";
                          }
                        }
                        if (emaiL == "") {
                          feedback += "Please provide an e-mail! ";
                        }
                        if (messagE == "") {
                          feedback += "Please type your message! ";
                        }

                        if (namE != "" &&
                            emaiL != "" &&
                            emaiL.contains(regex) &&
                            subjecT != "" &&
                            messagE != "") {
                          await sendMail(
                                  name: namE,
                                  email: emaiL,
                                  subject: subjecT,
                                  message: messagE)
                              .then((value) {});
                        }
                        setState(() {
                          emailSent = true;
                        });
                      }),
                      style: ButtonStyle(
                          side: MaterialStateBorderSide.resolveWith((states) =>
                              const BorderSide(color: Colors.white)),
                          overlayColor: MaterialStateColor.resolveWith(
                              (states) => Colors.transparent),
                          minimumSize: MaterialStateProperty.resolveWith(
                              (states) => const Size(150, 50))),
                      child: const Text(
                        "Send",
                        style: TextStyle(color: Colors.white),
                      )),
                ),
                const SizedBox(height: 50),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  height: emailSent ? 70 : 0,
                  width: emailSent ? 400 : 0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Colors.red.withOpacity(0.4),
                            Colors.green.withOpacity(0.4),
                            Colors.blue.withOpacity(0.4)
                          ])),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Text(
                          feedback,
                          maxLines: 3,
                          textAlign: TextAlign.center,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 50),
          Container(
            height: 80,
            color: Colors.black,
            child: Center(
              child: Column(
                children: [
                  const Text(
                    "Socials",
                    style: TextStyle(color: Colors.blue, fontSize: 24),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: (() {
                          html.window
                              .open("https://github.com/3rs1n4cti0n", "");
                        }),
                        child: const Text(
                          "Github",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      const SizedBox(
                        width: 25,
                      ),
                      GestureDetector(
                        onTap: (() {
                          html.window.open(
                              "https://www.linkedin.com/in/ersantzampazchatip/",
                              "");
                        }),
                        child: const Text(
                          "LinkedIn",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CarouselListItemVerticalNoImage extends StatelessWidget {
  const CarouselListItemVerticalNoImage(
      {super.key,
      required this.title,
      required this.description,
      required this.linkPage});

  final String title;
  final String description;
  final String linkPage;
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            backgroundBlendMode: BlendMode.softLight,
            borderRadius: BorderRadius.circular(30),
            boxShadow: const [
              BoxShadow(
                  blurStyle: BlurStyle.outer,
                  color: Colors.white,
                  blurRadius: 2)
            ],
            gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.white,
                  Colors.blueGrey,
                  Colors.blueGrey,
                  Colors.blueGrey,
                  Colors.white,
                ])),
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Text(
                title,
                style: const TextStyle(color: Colors.white, fontSize: 24),
              ),
              const SizedBox(
                height: 25,
              ),
              Expanded(
                child: Center(
                  child: Text(
                    description,
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
              Center(
                child: TextButton(
                  onPressed: () {
                    html.window.open(linkPage, "");
                  },
                  child: const Text(
                    "Follow Link",
                    style: TextStyle(color: Colors.orange),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}

class CarouselListItemHorizontal extends StatelessWidget {
  const CarouselListItemHorizontal(
      {super.key,
      required this.title,
      required this.description,
      required this.imagePath,
      required this.linkPage});

  final String title;
  final String description;
  final String imagePath;
  final String linkPage;
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            backgroundBlendMode: BlendMode.softLight,
            boxShadow: const [
              BoxShadow(
                  blurStyle: BlurStyle.outer,
                  color: Colors.white,
                  blurRadius: 2)
            ],
            gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.white,
                  Colors.blueGrey,
                  Colors.blueGrey,
                  Colors.blueGrey,
                  Colors.white,
                ])),
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Text(
                        title,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 24),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          description,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                    Center(
                      child: TextButton(
                        onPressed: () {
                          html.window.open(linkPage, "");
                        },
                        child: const Text(
                          "Follow Link",
                          style: TextStyle(color: Colors.orange),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

class CarouselListItemVertical extends StatelessWidget {
  const CarouselListItemVertical({
    Key? key,
    required this.title,
    required this.description,
    required this.imagePath,
    required this.linkPage,
    required this.shadowColor,
  }) : super(key: key);
  final String title;
  final String description;
  final String imagePath;
  final String linkPage;
  final Color shadowColor;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            backgroundBlendMode: BlendMode.softLight,
            borderRadius: BorderRadius.circular(30),
            // ignore: prefer_const_literals_to_create_immutables
            boxShadow: [
              const BoxShadow(
                  blurStyle: BlurStyle.outer,
                  color: Colors.white,
                  blurRadius: 2)
            ],
            gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.white,
                  Colors.blueGrey,
                  Colors.blueGrey,
                  Colors.blueGrey,
                  Colors.white,
                ])),
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Text(
                title,
                style: const TextStyle(color: Colors.white, fontSize: 24),
              ),
              const SizedBox(
                height: 25,
              ),
              Expanded(
                flex: 2,
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          offset: const Offset(0, 3),
                          color: shadowColor == Colors.white
                              ? shadowColor.withOpacity(0.3)
                              : shadowColor,
                          blurRadius: 1)
                    ],
                  ),
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: Text(
                    description,
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
              Center(
                child: TextButton(
                  onPressed: () {
                    html.window.open(linkPage, "");
                  },
                  child: const Text(
                    "Follow Link",
                    style: TextStyle(color: Colors.orange),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}

class skillContainer extends StatelessWidget {
  const skillContainer({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 50,
      decoration: BoxDecoration(
          color: Colors.pink,
          borderRadius: const BorderRadius.all(Radius.circular(80)),
          backgroundBlendMode: BlendMode.softLight,
          border: Border.all(color: Colors.white)),
      child: Center(
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class CustomTextField extends StatefulWidget {
  CustomTextField(
      {Key? key,
      required this.width,
      this.linecount,
      this.error,
      required this.hinttext,
      required this.onChanged})
      : super(key: key);

  final double width;
  int? linecount;
  final String hinttext;
  final void Function(String) onChanged;
  String? error = "";

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
          maxWidth: (widget.width - 200).clamp(600, 1200), minWidth: 600),
      child: TextFormField(
        onChanged: (value) {
          widget.onChanged(value);
        },
        maxLines: widget.linecount ?? 1,
        cursorColor: Colors.white,
        decoration: InputDecoration(
          errorText: widget.error,
          errorStyle: const TextStyle(color: Colors.white),
          hintText: widget.hinttext,
          hintStyle: TextStyle(color: Colors.white.withOpacity(0.4)),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
            color: Colors.white,
            width: 1,
          )),
          errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(
            color: Colors.white,
            width: 1,
          )),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
            color: Colors.white,
            width: 1,
          )),
        ),
      ),
    );
  }
}
