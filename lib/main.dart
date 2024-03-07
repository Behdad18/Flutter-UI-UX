import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.dark;
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    Color surfaceColor = const Color(0x0dffffff);
    // ignore: unused_local_variable
    Color primaryColor = Colors.pink.shade400;
    return MaterialApp(
      title: 'Flutter Demo',
      //for widget/CupertinoIcons and ....
        localizationsDelegates: [
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ],
    supportedLocales: [
    Locale('en'), // English
    Locale('fa'), // Farsi/Persian
  ],
      theme:  _themeMode == ThemeMode.dark
          ? MyAppThemConfig.dark().getTheme()
          : MyAppThemConfig.light().getTheme(),
      home: MyHomePage(
        toggleThemeMode: () {
          setState(
            () {
              if (_themeMode == ThemeMode.dark)
                _themeMode = ThemeMode.light;
              else
                _themeMode = ThemeMode.dark;
            },
          );
        },
      ),
    );
  }
}

class MyAppThemConfig {
  final Color primaryColor = Colors.pink.shade400;
  final Color primaryTextColor;
  final Color secondaryTextColor;
  final Color surfaceColor;
  final Color backgroundColor;
  final Color appBarColor;
  final Brightness brightness;

  MyAppThemConfig.dark()
      : primaryTextColor = Colors.white,
        secondaryTextColor = Colors.white70,
        surfaceColor = Color(0x0dffffff),
        backgroundColor = Color.fromARGB(255, 30, 30, 30),
        appBarColor = Colors.black,
        brightness = Brightness.dark;

  MyAppThemConfig.light()
      : primaryTextColor = Colors.grey.shade900,
        secondaryTextColor = Colors.grey.shade900.withOpacity(0.8),
        surfaceColor = Color(0x0d000000),
        backgroundColor = Colors.white,
        appBarColor = Color.fromARGB(255, 235, 235, 235),
        brightness = Brightness.light;

  ThemeData getTheme() {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.deepPurple,
        brightness: brightness,
      ),
      useMaterial3: true,
      primaryColor: primaryColor,
      dividerColor: surfaceColor,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(primaryColor),
        ),
      ),
      scaffoldBackgroundColor: backgroundColor,
      appBarTheme: AppBarTheme(
        elevation: 0,
        backgroundColor: appBarColor,foregroundColor: primaryTextColor),
      inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none),
          filled: true,
          fillColor: surfaceColor),
      textTheme: GoogleFonts.latoTextTheme(
        TextTheme(
          // ignore: deprecated_member_use
          bodyText2: TextStyle(
            color: primaryTextColor,
            fontSize: 15,
          ),
          // ignore: deprecated_member_use
          headline6:
              TextStyle(fontWeight: FontWeight.w900, color: primaryTextColor),
          // ignore: deprecated_member_use
          bodyText1: TextStyle(fontSize: 13, color: secondaryTextColor),
          // ignore: deprecated_member_use
          subtitle1: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: primaryTextColor),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final Function() toggleThemeMode;
  const MyHomePage({super.key, required this.toggleThemeMode});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

enum _SkillType { photoshop, xd, afterEffect, illustrator, lightroom }

class _MyHomePageState extends State<MyHomePage> {
  // ignore: unused_field
  _SkillType _skill = _SkillType.afterEffect;
  void updateSelectedSkill(_SkillType skilltype) {
    setState(() {
      this._skill = skilltype;
    });
  }

  @override
  Widget build(BuildContext context) {
    //scaffold is a widget in app for body
    return Scaffold(
        appBar: AppBar(
          title: const Text('Curriculum Vitae'),
          actions: [
            Icon(CupertinoIcons.chat_bubble),
            SizedBox(
              width: 8,
            ),
            InkWell(
              onTap: widget.toggleThemeMode,
              child: Padding(
                padding: EdgeInsets.fromLTRB(8, 0, 16, 0),
                child: Icon(CupertinoIcons.ellipsis_vertical),
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(32),
                child: Row(
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          'assets/image/profile_image.png',
                          width: 60,
                          height: 60,
                        )),
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Brice Seraphin',
                            // ignore: deprecated_member_use
                            style: Theme.of(context).textTheme.subtitle1,
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          const Text('Product & Print Design'),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              Icon(
                                // ignore: deprecated_member_use
                                CupertinoIcons.location_solid,
                                size: 13,
                                color:
                                    // ignore: deprecated_member_use
                                    Theme.of(context)
                                        .textTheme
                                        .bodyText1!
                                        .color,
                              ),
                              const SizedBox(
                                width: 3,
                              ),
                              // ignore: deprecated_member_use
                              Text(
                                'Paris, France',
                                // ignore: deprecated_member_use
                                style: Theme.of(context).textTheme.caption,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Icon(
                      CupertinoIcons.heart,
                      color: Theme.of(context).primaryColor,
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(32, 0, 32, 16),
                child: Text(
                  // ignore: deprecated_member_use
                  'Lorem ipsum dollor developer computer flutter and ui Design read book selection jak android java kotlin google apple french spanish ',
                  // ignore: deprecated_member_use
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.fromLTRB(32, 16, 32, 12),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // ignore: deprecated_member_use
                    Text(
                      'Skills',
                      style: Theme.of(context)
                          .textTheme
                          // ignore: deprecated_member_use
                          .bodyText2!
                          .copyWith(fontWeight: FontWeight.w900),
                    ),
                    const SizedBox(
                      width: 2,
                    ),
                    const Icon(
                      CupertinoIcons.chevron_down,
                      size: 12,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Center(
                child: Wrap(
                  direction: Axis.horizontal,
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    Skill(
                        type: _SkillType.photoshop,
                        title: 'Photoshop',
                        imagepath: 'assets/image/app_icon_01.png',
                        shadowColor: Colors.blue,
                        isActiv: true,
                        onTap: () {
                          updateSelectedSkill(_SkillType.photoshop);
                        }),
                    Skill(
                        type: _SkillType.xd,
                        title: 'Adobe Xd',
                        imagepath: 'assets/image/app_icon_05.png',
                        shadowColor: Colors.pink,
                        isActiv: false,
                        onTap: () {
                          updateSelectedSkill(_SkillType.xd);
                        }),
                    Skill(
                        type: _SkillType.illustrator,
                        title: 'Illustrator',
                        imagepath: 'assets/image/app_icon_04.png',
                        shadowColor: Colors.orange,
                        isActiv: false,
                        onTap: () {
                          updateSelectedSkill(_SkillType.illustrator);
                        }),
                    Skill(
                        type: _SkillType.afterEffect,
                        title: 'After Effect',
                        imagepath: 'assets/image/app_icon_03.png',
                        shadowColor: Colors.blue.shade800,
                        isActiv: false,
                        onTap: () {
                          updateSelectedSkill(_SkillType.afterEffect);
                        }),
                    Skill(
                        type: _SkillType.lightroom,
                        title: 'Light room',
                        imagepath: 'assets/image/app_icon_02.png',
                        shadowColor: Colors.blue,
                        isActiv: false,
                        onTap: () {
                          updateSelectedSkill(_SkillType.lightroom);
                        }),
                  ],
                ),
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.fromLTRB(32, 12, 32, 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Personal Information',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .copyWith(fontWeight: FontWeight.w900),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    const TextField(
                      decoration: InputDecoration(
                          labelText: 'Email',
                          prefixIcon: Icon(CupertinoIcons.at)),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const TextField(
                      decoration: InputDecoration(
                          labelText: 'Password',
                          prefixIcon: Icon(CupertinoIcons.lock)),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    SizedBox(
                        height: 48,
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: () {}, child: const Text('Save')))
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

class Skill extends StatelessWidget {
  final _SkillType type;
  final String title;
  final String imagepath;
  final Color shadowColor;
  final bool isActiv;
  final Function() onTap;
  const Skill({
    super.key,
    required this.type,
    required this.title,
    required this.imagepath,
    required this.shadowColor,
    required this.isActiv,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onTap,
      child: Container(
        width: 110,
        height: 110,
        decoration: isActiv
            ? BoxDecoration(
                color: Theme.of(context).dividerColor,
                borderRadius: BorderRadius.circular(12))
            : null,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imagepath,
              width: 40,
              height: 40,
            ),
            const SizedBox(
              height: 8,
            ),
            Text(title),
          ],
        ),
      ),
    );
  }
}
