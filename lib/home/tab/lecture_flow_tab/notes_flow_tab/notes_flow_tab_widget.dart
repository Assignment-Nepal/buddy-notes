import 'package:buddyapp/constant/app_colors.dart';
import 'package:buddyapp/home/tab/lecture_flow_tab/model/sem_models.dart';
import 'package:buddyapp/home/tab/lecture_flow_tab/notes_flow_tab/notes_tab.dart';
import 'package:buddyapp/home/tab/lecture_flow_tab/notes_flow_tab/question_tab.dart';
import 'package:buddyapp/home/tab/lecture_flow_tab/notes_flow_tab/syllabus_tab.dart';
import 'package:buddyapp/home/tab/lecture_flow_tab/snapshot.dart';
import 'package:buddyapp/utils/utils.dart';

import 'package:buddyapp/widget/offline_indicator.dart';
import 'package:buddyapp/widget/pull_refresh.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';




class NotesFlowTab extends StatefulWidget {
  final String faculty_id;

  const NotesFlowTab({Key? key, required this.faculty_id,
  }) : super(key: key);
  @override
  _NotesFlowTabState createState() => _NotesFlowTabState();
}

class _NotesFlowTabState extends State<NotesFlowTab> with
    WidgetsBindingObserver, SingleTickerProviderStateMixin,
    AutomaticKeepAliveClientMixin{
  int selectedTabPos = 0;

  List<String> _insightsTabs = ["Notes", "Syllabus", "Questions"];

  late TabController _tabController;


  Key _tabKey = GlobalKey();

  void _refreshScreen(RefreshController refreshController)async{


    setState(() {
      _tabKey = GlobalKey();
      listOfSemYear?.clear();
      listOfSemYear = null;
    });
    refreshController.refreshCompleted();
  }


  // AutomaticKeepAliveClientMixin: https://stackoverflow.com/a/51225879/5129047

  @override
  bool get wantKeepAlive => true;

  RefreshController? _refreshControllerTab;


  List<SemYearModel>? listOfSemYear;


  @override
  void initState() {
    super.initState();
    _refreshControllerTab = RefreshController();

    WidgetsBinding.instance!.addObserver(this);
    _tabController =  TabController(vsync: this, length: _insightsTabs.length);

    _tabController.addListener(() {
      selectedTabPos = _tabController.index;

    });

  }

  @override
  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      key: _tabKey,
      backgroundColor: AppColors.gray100,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(54),
        child: AppBar(
          title: Text("University Name"),
        ),
      ),
      body: SafeArea(
        child: OfflineIndicator(
          child: PullRefresh(
            refreshController: _refreshControllerTab,
            onRefresh: (){
              _refreshScreen(_refreshControllerTab!);
            },
            child: listOfSemYear == null ? semYearFutureBuilder() : tabBody(),
          ),
        ),
      ),
    );
  }

  Widget tabBody(){
    return  Column(
      children: <Widget>[
        getTabNavigation(),
        const SizedBox(height: 2),
        Expanded(
            child: getAllTab()
        )

      ],
    );
  }

  Widget semYearFutureBuilder(){
    return FutureBuilder(
      future: getSemYear(widget.faculty_id),
      builder: (
          BuildContext context,
          AsyncSnapshot snapshot,
          ) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            logger.e(snapshot.error);
            return const Text('Error');
          } else if (snapshot.hasData) {
             listOfSemYear = snapshot.data;
            return tabBody();
          } else {
            return const Text('Empty data');
          }
        } else {
          return Text('State: ${snapshot.connectionState}');
        }
      },
    );
  }

  Widget getTabNavigation() {

    double tabWidth = MediaQuery.of(context).size.width/_insightsTabs.length;

    return Container(
      decoration: BoxDecoration(
          color: AppColors.backgroundColor,
          boxShadow: [
            BoxShadow(
                color: AppColors.textColor.withOpacity(0.4),
                blurRadius: 4)
          ]
      ),
      child:  TabBar(
        //isScrollable: true,
        controller: _tabController,
        indicatorColor: Theme.of(context).primaryColor,
        indicatorSize: TabBarIndicatorSize.tab,
        unselectedLabelStyle:const TextStyle(fontWeight: FontWeight.normal) ,
        labelStyle: const TextStyle(fontWeight: FontWeight.bold),
        indicatorWeight: 3,
        tabs: List.generate(_insightsTabs.length, (int index) =>
            Container(
              width: tabWidth,
              padding:  const EdgeInsets.only(bottom: 8, top: 8),
              child: Text(_insightsTabs[index], textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16,
                    color: AppColors.textColor.withOpacity(0.8),)),
            )
        ),
      ),
    );
  }

  Widget getAllTab() {
    return Padding(
      padding:  const EdgeInsets.only(top: 4),
      child: TabBarView(
        controller: _tabController,
        children:  <Widget>[
          NotesTab(
            listOfSemYear: listOfSemYear,
          ),
          SyllabusTab(
            listOfSemYear: listOfSemYear,
          ),
          QuestionTab(
            listOfSemYear: listOfSemYear,
          ),
        ],
      ),
    );
  }


}


