
import 'package:Bipp/app/models/course_model.dart';
import 'package:Bipp/app/pages/course/course_page.dart';
import 'package:Bipp/app/shared/repository/course_repository.dart';
import 'package:Bipp/app/utils/theme/color.dart';
import 'package:Bipp/app/widgets/customAppBar.dart';
import 'package:Bipp/app/widgets/customButton.dart';
import 'package:Bipp/app/widgets/customDrawer.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      endDrawerEnableOpenDragGesture: false,
      endDrawer: CustomDrawer(),
      body: Column(
        children: <Widget>[
          CustomAppBar(scaffoldKey: _scaffoldKey),
          SizedBox(height: 20,),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(20),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5)
                ),
                width: double.maxFinite,
                child: FutureBuilder<List<CourseModel>>(
                  future: CourseRepository().getListOfCouses(),
                  builder: (context, snapshot) {
                    if (snapshot != null) {
                      int countButtons = 0;
                      return !snapshot.hasError && snapshot.hasData ? Column(
                        children: snapshot.data.map(
                          (courseModel) {
                            countButtons++;
                            return Column(
                              children: <Widget>[
                                CustomButton(
                                  title: courseModel.title,
                                  urlImage: courseModel.urlImage,
                                  buttonFunction: () => Navigator.push(context, MaterialPageRoute(
                                    builder: (context) => CoursePage(courseModel: courseModel,),)
                                  ),
                                ),
                                countButtons < snapshot.data.length ? Divider(): Container()
                              ],
                            );
                          },
                        ).toList()
                      ): Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(Icons.assignment_late, color: colorGreyB2, size: 30,),
                                SizedBox(width: 10,),
                                Text("Ops, algo deu errado!"),
                              ],
                            ),
                            SizedBox(height: 10,),
                            Text("Não encontramos nenhum curso ou treinamento para você!", textAlign: TextAlign.center,)
                          ],
                        ),
                      );
                    }else {
                      return Center(child: CircularProgressIndicator(),);
                    }
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}