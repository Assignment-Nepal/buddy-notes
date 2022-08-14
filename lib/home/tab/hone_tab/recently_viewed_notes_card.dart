import 'package:buddyapp/constant/app_colors.dart';
import 'package:buddyapp/home/tab/hone_tab/pdf_layout.dart';
import 'package:flutter/material.dart';

class RecentlyViewedNotes extends StatefulWidget {
  const RecentlyViewedNotes({Key? key}) : super(key: key);

  @override
  _RecentlyViewedNotesState createState() => _RecentlyViewedNotesState();
}

class _RecentlyViewedNotesState extends State<RecentlyViewedNotes> {
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
                    child: const Padding(
                      padding: EdgeInsets.only(right: 16),
                      child: RecentViewedItem(),
                    ),
                    onTap: () {

                    },
                  );
                }),
          )

        ],),
    );
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
      width: MediaQuery.of(context).size.width * .7,
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
        mainAxisAlignment: MainAxisAlignment.start,
        children: [

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              pdfLayout(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 4),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * .4,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:  const [
                      Text("DataStructure and Alogrothim",
                        softWrap: true,
                        maxLines: 2,
                        overflow: TextOverflow.fade,
                        style: TextStyle(color: AppColors.gray600,
                            fontSize: 14,
                            letterSpacing: .2,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      SizedBox(height: 4,),
                      Text("Dcrust university Haryana India",maxLines: 2,
                        overflow: TextOverflow.fade,
                        style: TextStyle(color: AppColors.gray600,fontSize: 12,letterSpacing: .2),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),

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
              Theme.of(context).primaryColor.withOpacity(0.6)),
          backgroundColor: AppColors.lightHintColor.withOpacity(0.3),
          value: .3,
        ),
      ),
    );
  }
}