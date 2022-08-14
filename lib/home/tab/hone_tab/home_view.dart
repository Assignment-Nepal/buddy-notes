
import 'package:buddyapp/home/tab/hone_tab/ask_for_notes_card.dart';
import 'package:buddyapp/home/tab/hone_tab/custom_app_bar.dart';
import 'package:buddyapp/home/tab/hone_tab/profile_widget.dart';
import 'package:buddyapp/home/tab/hone_tab/recently_viewed_notes_card.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children:  [

              const CustomAppBar(),

              const SizedBox(height: 4),

              ProfileWidget(onClicked: () {  }, imagePath: 'https://images.unsplash.com/photo-1554151228-14d9def656e4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=333&q=80',
              ),

              const SizedBox(height: 30,),

              const RecentlyViewedNotes(),

              const AskForNotesCard(),

            ],
          ),
        ),
      ),
    );
  }
}


