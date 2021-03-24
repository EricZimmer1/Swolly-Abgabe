import 'package:Swolly/pages/ProjectFlow/ProjectFlow3.dart';
import 'package:Swolly/pages/projectdetail/projectDetail.dart';
import 'package:Swolly/utils/res/Global.dart';
import 'package:Swolly/utils/res/Transitions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class CardViewDashboard extends StatefulWidget{
  @required
  final categoryList;
  final isProjectFlow;

  const CardViewDashboard({this.categoryList, this.isProjectFlow});

  @override
  _CardViewDashboardState createState() => _CardViewDashboardState();
}

class _CardViewDashboardState extends State<CardViewDashboard>{
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.categoryList.length,
        itemBuilder: (BuildContext context, int index) {
          return SingleCardCategory(
            isProjectFlow: widget.isProjectFlow,
            categoryName: widget.categoryList[index].name,
            categoryId: widget.categoryList[index].id,
            dashboardImage: serverUrlImages+widget.categoryList[index].image,//categoryList[index][2],
          );
        }
    );
  }
}

class SingleCardCategory extends StatelessWidget{
  final categoryName;
  final dashboardImage;
  final isProjectFlow;
  final categoryId;

  const SingleCardCategory({Key key, this.categoryName, this.dashboardImage, this.isProjectFlow, this.categoryId}) : super(key: key);

  void _onTapCard(BuildContext context){
    if (isProjectFlow) {
      createProject.setCategory(categoryId);
      Navigator.of(context).push(FadeRouteBuilder(page: ProjectFlow3(),transitionTime: 200));
    } else {
      Navigator.of(context).push(FadeRouteBuilder(page: ProjectDetail(initialPage: 0,category: categoryId),transitionTime: 200));
    }
  }

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 136,
      margin: EdgeInsets.symmetric(vertical: 8,horizontal: 16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          image: DecorationImage(image: NetworkImage(dashboardImage),fit: BoxFit.fill)
      ),
      child: InkWell(
        borderRadius: BorderRadius.all(Radius.circular(16)),
        onTap: () => _onTapCard(context),
        child: Container(
          alignment: Alignment.bottomLeft,
          margin: EdgeInsets.only(left: 19,bottom: 5),
          child: Text(
            categoryName,
            style: TextStyle(
                color: Colors.white,
                fontSize: 40,
                fontWeight: FontWeight.bold
            ),
          ),
        ),
      )
    );
  }
}