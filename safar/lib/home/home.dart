

import 'package:flutter/material.dart';
import 'package:safar_frontend/constant/app_colors.dart';

/// Enum for bottom tab management


enum BottomTab { Home, Explore,Add,Saved,Profile}

extension TabIndexExtension on BottomTab?{

  static const names = {
    BottomTab.Home: 'Home',
    BottomTab.Explore: 'Explore',
    BottomTab.Add: 'Add',
    BottomTab.Saved: 'Settings',
    BottomTab.Profile: 'Profile'
  };

  static const titles = {
    BottomTab.Home: 'Home',
    BottomTab.Explore: 'Explore',
    BottomTab.Add: 'Add',
    BottomTab.Saved: 'Saved',
    BottomTab.Profile: 'Profile'
  };

  int toIndex(BottomTab tab){
    switch(tab){

      case BottomTab.Home:
        return 0;
      case BottomTab.Explore:
        return 1;
      case BottomTab.Add:
        return 2;
      case BottomTab.Saved:
        return 3;
        case BottomTab.Profile:
        return 4;
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
  BottomTab? selectedBottomTab;



  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addObserver(this);
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

  Widget getBottomNavigationTab(BottomTab? bottomTab,) {

    return SafeArea(
      child: IndexedStack(
        index: selectedBottomTab?.index,
        children: _pages,
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
            child: PhysicalModel(
              color: AppColors.whiteBackgroundColor,
              elevation: 10,
              child: Container(
                height: 56,
                width: MediaQuery.of(context).size.width,
                color: AppColors.whiteBackgroundColor,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 29),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(BottomTab.values.length, (index) {
                      return InkWell(
                        onTap: (){
                          setState(() {
                            selectedBottomTab = BottomTab.values[index];
                          });
                        },
                          child: getNavigationBarICON(index));
                    }),
                  ),
                ),
              ),
            ),
          ),
        ),
        body: SafeArea(
            child: getBottomNavigationTab(selectedBottomTab)
        ),
      ),
    );
  }

  static const List<Widget> _pages = <Widget>[
    Icon(
      Icons.call,
      size: 150,
    ),
    Icon(
      Icons.camera,
      size: 150,
    ),
    Icon(
      Icons.chat,
      size: 150,
    ),
    Icon(
      Icons.camera,
      size: 150,
    ),
    Icon(
      Icons.chat,
      size: 150,
    ),
  ];

  getNavigationBarICON(int index){
    bool selected = selectedBottomTab == BottomTab.values[index];
    switch (index){

      case 0:
        return Icon(selected ? Icons.dashboard : Icons.add);

        case 1:
        return Icon(selected ? Icons.dashboard : Icons.add);

        case 2:

        return Icon(selected ? Icons.dashboard : Icons.add);

        case 3:
        return Icon(selected ? Icons.dashboard : Icons.add);

        case 4:
        return Icon(selected ? Icons.dashboard : Icons.add);


      default:
        throw Exception("Invalid tab");
    }
  }

}


class ScreenView extends StatelessWidget {
  const ScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}