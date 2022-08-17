import 'package:buddyapp/home/tab/lecture_flow_tab/model/sem_models.dart';
import 'package:flutter/material.dart';

import 'notes_tab.dart';

class QuestionTab extends StatefulWidget {
  final  List<SemYearModel>? listOfSemYear;
  const QuestionTab({Key? key,this.listOfSemYear}) : super(key: key);

  @override
  _QuestionTabState createState() => _QuestionTabState();
}

class _QuestionTabState extends State<QuestionTab>  {
  @override
    @override
    Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
      child: listViewBuilder(widget.listOfSemYear,"Questions",),
    );
    }
}
