
import 'package:buddyapp/home/tab/hone_tab/home_view.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';


/// Enum for bottom tab management

enum BottomTab { Home, LectureFlow, Downloads, Settings}



extension TabIndexExtension on BottomTab?{

  static const names = {
    BottomTab.Home: 'Home',
    BottomTab.LectureFlow: 'LectureFlow',
    BottomTab.Downloads: 'Downloads',
    BottomTab.Settings: 'Settings',

  };

  static const titles = {
    BottomTab.Home: 'Home',
    BottomTab.LectureFlow: 'LectureFlow',
    BottomTab.Downloads: 'Downloads',
    BottomTab.Settings: 'Setting',

  };

  int toIndex(BottomTab tab){
    switch(tab){
      case BottomTab.Home:
        return 0;
      case BottomTab.LectureFlow:
        return 1;
      case BottomTab.Downloads:
        return 2;
      case BottomTab.Settings:
        return 3;
      default:
        throw Exception("Invalid tab");
    }
  }

  String? get title{
    return titles[this!];
  }

  String? get name{
    return names[this!];
  }

}

const DEFAULT_TAB = BottomTab.Home;




class HomeRoute extends StatefulWidget {

  final BottomTab selectedBottomTab;
  const HomeRoute({Key? key,
    BottomTab? selectedBottomTab,
  }) :  this.selectedBottomTab = selectedBottomTab ?? BottomTab.Home,
        super(key: key);


  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<HomeRoute> with SingleTickerProviderStateMixin, WidgetsBindingObserver{

  AnimationController? buttonController;
  Animation? buttonZoomOutAnimation;
  PageController? _dashboardController;
  late Duration _tabChangeDuration;
  BottomTab? selectedBottomTab;


  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addObserver(this);
    _tabChangeDuration = const Duration(milliseconds: 400);
    selectedBottomTab = widget.selectedBottomTab;
    _dashboardController = PageController(initialPage: selectedBottomTab!.index, keepPage: true);

  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.detached:
        break;
      case AppLifecycleState.resumed:
        break;
      case AppLifecycleState.inactive:
        break;
      case AppLifecycleState.paused:
        break;
    }
  }

  @override
  void dispose() {
    _dashboardController!.dispose();
    WidgetsBinding.instance!.removeObserver(this);
    super.dispose();
  }




  Widget _getBottomNavigationWidget(int index, Color color, double size){

    switch (index){
      case 0:
        return Icon(Icons.dashboard, color: color, size: size);

      case 1:
        return Icon(Icons.note_add_outlined, color: color,size: size,);

      case 2:
        return Icon(Icons.download_for_offline, color: color, size: size,);


      case 3:
        return Icon(Icons.settings, color: color,size: size,);

      default:
        return const SizedBox();
    }
  }






  Widget getBottomNavigationTab(BottomTab? bottomTab) {

    return SafeArea(
      child: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _dashboardController,
        children: <Widget>[

          HomeView(),
          ScreenView(),
          ScreenView(),
          ScreenView(),


        ],
      ),
    );
  }



  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        bottomNavigationBar:  Container(
          color: Theme.of(context).primaryColor,
          height: 52,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: CurvedNavigationBar(
              index: selectedBottomTab!.index,
              height: 45,
              color: Colors.white,
              backgroundColor: Theme.of(context).primaryColor,
              animationDuration: _tabChangeDuration,
              animationCurve: Curves.linear,
              items: List<Widget>.generate(BottomTab.values.length, (int index){
                return _getBottomNavigationWidget(index,Theme.of(context).primaryColor,22);
              }),

              onTap: (int index){
                if (_dashboardController!.hasClients) {
                  _dashboardController!.animateToPage(index,
                      duration: _tabChangeDuration,
                      curve: Curves.easeInOut);
                }
                setState(() {
                  selectedBottomTab = BottomTab.values[index];
                });
              },
            ),
          ),
        ),
        body: SafeArea(
            child: getBottomNavigationTab(selectedBottomTab)
        ),
      ),
    );
  }
}

class ScreenView extends StatelessWidget {
  const ScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
