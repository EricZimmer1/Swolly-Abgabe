import 'package:Swolly/pages/projectdetail/projectDetail.dart';
import 'package:Swolly/utils/res/Global.dart';
import 'package:Swolly/utils/res/Transitions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class CardViewDashboardInit extends StatefulWidget{
  @required
  final projectList;

  const CardViewDashboardInit({this.projectList});

  @override
  _CardViewDashboardInitState createState() => _CardViewDashboardInitState();
}

class _CardViewDashboardInitState extends State<CardViewDashboardInit>{
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.projectList.length,
        itemBuilder: (BuildContext context, int index) {
          return SingleCardProject(
            index: index,
            projectName: widget.projectList[index].title,
            dashboardImage: serverUrl+'/img/'+widget.projectList[index].images[0],//categoryList[index][2],
          );
        }
    );
  }
}

class SingleCardProject extends StatelessWidget{
  final index;
  final projectName;
  final dashboardImage;

  const SingleCardProject({Key key, this.projectName, this.dashboardImage, this.index}) : super(key: key);

  void _onTapCard(BuildContext context){
    Navigator.of(context).push(FadeRouteBuilder(page: ProjectDetail(initialPage: index,),transitionTime: 200));
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
        child: Column(
          children: [
            Visibility(
              visible: true,
                child: Container(
                    alignment: Alignment.topRight,
                    margin: EdgeInsets.only(right: 8),
                    child: IconButton(
                        icon: Icon(
                          Icons.warning_rounded,
                          color: Colors.red,
                          size: 36,
                        )
                    )
                )
            ),
            Expanded(
                child: SizedBox()
            ),
            Container(
              alignment: Alignment.bottomLeft,
              margin: EdgeInsets.only(left: 20,bottom: 5),
              child: Text(
                projectName,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
          ],
        )
      )
    );
  }
}