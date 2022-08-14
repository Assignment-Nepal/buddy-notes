
import 'package:buddyapp/auth_ui/constants/strings.dart';
import 'package:buddyapp/constant/app_colors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';


class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: const [

          SizedBox(height: 30,),

          RecentlyReadNotes(),

          AskForNotesCard(),

        ],
      ),
    );
  }
}



class AskForNotesCard extends StatefulWidget {
  const AskForNotesCard({Key? key,
  }) : super(key: key);
  @override
  _AskForNotesCardState createState() => _AskForNotesCardState();
}

class _AskForNotesCardState extends State<AskForNotesCard> {


  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [

        const SizedBox(height: 30),

        const Padding(
          padding:  EdgeInsets.only(left: 16, right: 16,bottom: 15),
          child: Text(Strings.askForNotesTittle, maxLines: 1, overflow: TextOverflow.fade, softWrap: false,
              style: TextStyle(color:AppColors.textColorLighter, fontSize: 18,fontWeight: FontWeight.w500)),
        ),

        askMyNotesCard(context),

        const SizedBox(height: 30),
      ],
    );
  }
  Widget askMyNotesCard(BuildContext context){
    return Padding(
      padding:  const EdgeInsets.symmetric(horizontal: 16,),
      child: Stack(
        children: [
          Container(
              width: double.infinity,
              decoration:BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                        offset: const Offset(1, 1),
                        blurRadius: 2,
                        color: Colors.black.withOpacity(.25)
                    )
                  ]
              ),
              child: Column(
                children: [
                  const SizedBox(height: 18),
                  InkWell(
                    onTap: () {

                    },
                    child: SizedBox(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Container(
                            margin:  const EdgeInsets.only(left: 10),
                            height: 45,
                            width: 40,
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color:AppColors.yellowNotesColor,
                            ),
                            child: const Icon(Icons.star,color: AppColors.accentContrastColor,size: 24,),),

                          const SizedBox(width: 5,),

                          Expanded(
                              child: Padding(
                                padding:  const EdgeInsets.symmetric(horizontal: 10 ,vertical: 5),

                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [

                                    const Text(Strings.askForNotes,maxLines: 3,
                                      overflow: TextOverflow.fade,
                                      style: TextStyle(color: AppColors.gray600,fontSize: 14,letterSpacing: .2),
                                    ),

                                    const SizedBox(height: 16),

                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(children: [

                                          Container(
                                            height: 20,
                                            width: 6,
                                            color: Colors.green,
                                          ),

                                          const SizedBox(width: 8),

                                          const Text(Strings.letsCollaborate,maxLines: 1,
                                            overflow: TextOverflow.fade,
                                            style: TextStyle(color: AppColors.gray600,fontSize: 14,letterSpacing: .2),
                                          ),
                                        ],),

                                        Row(
                                          children: [
                                            avatarWidget(),
                                            avatarWidget(),
                                            avatarWidget()
                                          ],
                                        ),

                                      ],
                                    ),
                                  ],
                                ),
                              )),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              )),

        ],
      ),
    );
  }

  Widget avatarWidget({String? assets}){
    return const CircleAvatar(
      //backgroundImage: ExactAssetImage(assets),
      radius: 15,
    );
  }

}


class RecentlyReadNotes extends StatefulWidget {
  const RecentlyReadNotes({Key? key}) : super(key: key);

  @override
  _RecentlyReadNotesState createState() => _RecentlyReadNotesState();
}

class _RecentlyReadNotesState extends State<RecentlyReadNotes> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          getDashboardSectionHeader(context, "Recently Viewed Notes",
              enableViewAll: true, viewAllFunc:(){}),
          const SizedBox(height: 4),

          Container(
            height: 100,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount:10,
                shrinkWrap: true,
                itemBuilder: (context, index) {

                  return InkWell(
                    child: const RecentViewedItem(),
                    onTap: () {

                    },
                  );
                }),
          )

      ],),
    );
  }
}


Widget getDashboardSectionHeader(BuildContext context, String title, {
  bool enableFilter = false, filterFunc,
  bool enableViewAll = false, viewAllFunc,
  Function? actionCTA, Widget? actionWidget}) {

  return Padding(
    padding:  const EdgeInsets.only(left: 0, right: 8, bottom: 4),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: <Widget>[
            Padding(
              padding:  const EdgeInsets.only(right: 8),
              child: Text(title, key: Key(title),style: const TextStyle(
                  fontSize: 18,
                  color: AppColors.textColorLight,
                  letterSpacing: 0.2,
                  fontWeight: FontWeight.w500
              )),
            ),
            enableFilter ? InkWell(
              child: const Icon(Icons.filter_list, size: 16, color: AppColors.textColorLight),
              onTap: () {
                filterFunc(context);
              },
            ): const SizedBox(),

            actionWidget != null
                ? GestureDetector(
              onTap: actionCTA as void Function()?,
              child: Padding(
                padding:  EdgeInsets.all(3),
                child: actionWidget,
              ),
            )
                : const SizedBox()

          ],
        ),

        enableViewAll ? InkWell(
          onTap: () {
            viewAllFunc(context);
          },
          child: Row(
            children: <Widget>[
              Padding(
                padding:  const EdgeInsets.only(right: 2),
                child: Text("VIEW ALL", style: TextStyle(
                    fontSize: 12,
                    color:Theme.of(context).primaryColor.withOpacity(0.8),
                    letterSpacing: 0.1,
                    fontWeight: FontWeight.w500
                )),
              ),

              Icon(Icons.chevron_right, size: 18, color: Theme.of(context).primaryColor.withOpacity(0.5))
            ],
          ),
        ): const SizedBox()
      ],
    ),
  );
}

class RecentViewedItem extends StatefulWidget {
  const RecentViewedItem({Key? key}) : super(key: key);

  @override
  _RecentViewedItemState createState() => _RecentViewedItemState();
}

class _RecentViewedItemState extends State<RecentViewedItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .6,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(8)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(1, 1),
              blurRadius: 2,
            )
          ]
      ),
      child: Column(
        children: [

          const Spacer(),

          getLinearProgress(),
        ],
      ),
    );
  }
  Widget getLinearProgress() {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(6),
          bottomRight: Radius.circular(6)),
      child: Container(
        height: 6,
        child: LinearProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(
              AppColors.violetDarkColor.withOpacity(0.6)),
          backgroundColor: AppColors.lightHintColor.withOpacity(0.3),
          value: .3,
        ),
      ),
    );
  }
}
