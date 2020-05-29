import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutternotebook6thstory/ep463_waching_machine/providers/main_provider.dart';
import 'package:flutternotebook6thstory/ep463_waching_machine/providers/settings_provider.dart';
import 'package:flutternotebook6thstory/ep463_waching_machine/providers/theme_provider.dart';
import 'package:flutternotebook6thstory/ep463_waching_machine/providers/timer_provider.dart';
import 'package:flutternotebook6thstory/ep463_waching_machine/service_locator.dart';
import 'package:flutternotebook6thstory/ep463_waching_machine/ui/neumorphic_container.dart';
import 'package:flutternotebook6thstory/ep463_waching_machine/ui/neumorphic_icon_button.dart';
import 'package:flutternotebook6thstory/ep463_waching_machine/utils/colors.dart';
import 'package:flutternotebook6thstory/ep463_waching_machine/utils/consts.dart';
import 'package:flutternotebook6thstory/ep463_waching_machine/water_drawer.dart';
import 'package:provider/provider.dart';

class WashingMachineApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ServiceLocator.get<ThemeProvider>(),
        ),
        ChangeNotifierProvider(
          create: (context) => ServiceLocator.get<TimerProvider>(),
        ),
        ChangeNotifierProvider(
          create: (context)=> ServiceLocator.get<MainProvider>(),
        ),
        ChangeNotifierProvider(
          create: (context)=> ServiceLocator.get<SettingsProvider>(),
        )
      ],
      child: MaterialApp(
        home: WashingMachineMainPage(),
      ),
    );
  }
}

class WashingMachineMainPage extends StatefulWidget {
  static const margin = EdgeInsets.only(left: GLOBAL_EDGE_MARGIN_VALUE);

  @override
  _WashingMachineMainPageState createState() => _WashingMachineMainPageState();
}

class _WashingMachineMainPageState extends State<WashingMachineMainPage> {
  static const margin = EdgeInsets.only(
    left: GLOBAL_EDGE_MARGIN_VALUE,
  );

  Widget TopBar() {
    return Container(
      margin: EdgeInsets.fromLTRB(GLOBAL_EDGE_MARGIN_VALUE, DRAWER_BUTTON_MARGIN_TOP, 18, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          NeumorphicIconButton(
            icon: Icon(
              Icons.settings,
              color: CustomColors.icon,
            ),
            onTap: () {
              showModalBottomSheet(
                  context: context, backgroundColor: Colors.transparent, builder: (context) => Container());
            },
          ),
          TimerPanel(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, value, _) {
        return Container(
          color: CustomColors.primaryColor,
          child: Scaffold(
            backgroundColor: CustomColors.primaryColor,
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(100),
              child: SafeArea(
                child: TopBar(),
              ),
            ),
            drawerScrimColor: Colors.black.withAlpha(50),
            drawer: ClipRRect(
              borderRadius: BorderRadius.only(topRight: Radius.circular(45), bottomRight: Radius.circular(45)),
              child: Drawer(
                child: WaterDrawer(),
              ),
            ),
            body: SingleChildScrollView(
              child: Container(
                child: Stack(
                  children: [
                    Positioned(
                      right: 0,
                      child: Transform.translate(
                        offset: Offset(100, 120),
                        child: Container(
                          width: 300,
                          height: 300,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 25,
                        ),
                        Padding(
                          padding: margin,
                          child: Text(
                            "Smart Washing",
                            style: TextStyle(
                              fontSize: 28,
                              color: CustomColors.primaryTextColor,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Padding(
                          padding: margin,
                          child: Text(
                            "Machine",
                            style: TextStyle(
                              fontSize: 26,
                              color: CustomColors.primaryTextColor,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 70,
                        ),
                        Padding(
                          padding: margin,
                          child: _FunctionButtonsList(),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class TimerPanel extends StatefulWidget {
  @override
  _TimelinePanelState createState() => _TimelinePanelState();
}

class _TimelinePanelState extends State<TimerPanel> {
  @override
  Widget build(BuildContext context) {
    return NeumorphicContainer(
      width: 115,
      height: 52,
      pressed: true,
      border: Border.all(color: CustomColors.timerPanelBorder, width: 2),
      child: Center(
        child: Consumer<TimerProvider>(
          builder: (context, value, _) {
            return Text(
              value.remainingString,
              style: TextStyle(color: CustomColors.secondaryTextColor, letterSpacing: 3, fontSize: 22),
            );
          },
        ),
      ),
    );
  }
}

class _FunctionButtonsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var margin = EdgeInsets.only(bottom: 28);
    return Consumer<MainProvider>(
      builder: (context, value, _) {
        return Column(
          children: [
            NeumorphicIconButton(
              margin: margin,
              icon: Icon(Icons.power_settings_new),
              color: CustomColors.icon,
            )
          ],
        );
      },
    );
  }
}

class _Indicator extends StatefulWidget {
  @override
  __IndicatorState createState() => __IndicatorState();
}

class __IndicatorState extends State<_Indicator> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class _ModeList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
