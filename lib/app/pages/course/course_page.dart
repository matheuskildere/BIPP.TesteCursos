import 'package:Bipp/app/models/course_model.dart';
import 'package:Bipp/app/widgets/customAppBar.dart';
import 'package:Bipp/app/widgets/customDrawer.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';

class CoursePage extends StatefulWidget {
  final CourseModel courseModel;

  CoursePage({this.courseModel});

  @override
  _CoursePageState createState() => _CoursePageState();

}

class _CoursePageState extends State<CoursePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: CustomDrawer(),
      body: Column(
        children: <Widget>[
          CustomAppBar(isCoursePage: true, courseModel: widget.courseModel, scaffoldKey: _scaffoldKey,),
          SizedBox(height: 20,),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(20),
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5)
                ),
                width: double.maxFinite,
                child: Column(
                  children: <Widget>[
                    Text(
                      widget.courseModel.description,
                      style: Theme.of(context).textTheme.headline2,
                    ),
                    SizedBox(height: 20,),
                    widget.courseModel.urlImagesDescription != null && widget.courseModel.urlImagesDescription.length > 0 ? Wrap(
                      alignment: WrapAlignment.center,
                      spacing: 10,
                      runSpacing: 10,
                      children: widget.courseModel.urlImagesDescription.map((url) => 
                        ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: FancyShimmerImage(
                            height: size.width/3,
                            width: size.width/3, 
                            imageUrl: url,
                            boxFit: BoxFit.cover,  
                          ),
                        ),
                      ).toList()
                    ): Container()
                  ],
                )
              ),
            ),
          )
        ],
      ),
    );
  }
}