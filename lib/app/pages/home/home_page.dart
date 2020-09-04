import 'dart:convert';

import 'package:Bipp/app/widgets/customAppBar.dart';
import 'package:Bipp/app/widgets/customButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Column(
        children: <Widget>[
          CustomAppBar(),
          SizedBox(height: 20,),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.only(left: 20.0, right: 20, top: 20, bottom: 20),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5)
                ),
                width: double.maxFinite,
                child: FutureBuilder(
                  future: DefaultAssetBundle.of(context).loadString('assets/data/courses_data.json'),
                  builder: (context, snapshot) {
                    print(snapshot.data);
                    return Column(

                    );
                  },
                ),
                // child: Column(
                //   children: <Widget>[
                //     CustomButton(
                //       title: "Curso número um para montagem",
                //       urlImage: "https://s2.glbimg.com/eUN4P_OpCjHKzqGa3Cmi4-Y4jRA=/0x0:695x376/984x0/smart/filters:strip_icc()/i.s3.glbimg.com/v1/AUTH_08fbf48bc0524877943fe86e43087e7a/internal_photos/bs/2018/l/b/AyCpHmQYq70WvFk9QZBA/lsev-carro-impresso-em-3d-1.png",
                //     ),
                //     Divider(),
                //     CustomButton(
                //       title: "Curso número um para montagem",
                //       urlImage: "https://s2.glbimg.com/eUN4P_OpCjHKzqGa3Cmi4-Y4jRA=/0x0:695x376/984x0/smart/filters:strip_icc()/i.s3.glbimg.com/v1/AUTH_08fbf48bc0524877943fe86e43087e7a/internal_photos/bs/2018/l/b/AyCpHmQYq70WvFk9QZBA/lsev-carro-impresso-em-3d-1.png",
                //     ),
                //     Divider(),
                //     CustomButton(
                //       title: "Curso número um para montagem",
                //       urlImage: "https://s2.glbimg.com/eUN4P_OpCjHKzqGa3Cmi4-Y4jRA=/0x0:695x376/984x0/smart/filters:strip_icc()/i.s3.glbimg.com/v1/AUTH_08fbf48bc0524877943fe86e43087e7a/internal_photos/bs/2018/l/b/AyCpHmQYq70WvFk9QZBA/lsev-carro-impresso-em-3d-1.png",
                //     ),
                //     Divider(),
                //     CustomButton(
                //       title: "Curso número um para montagem",
                //       urlImage: "https://s2.glbimg.com/eUN4P_OpCjHKzqGa3Cmi4-Y4jRA=/0x0:695x376/984x0/smart/filters:strip_icc()/i.s3.glbimg.com/v1/AUTH_08fbf48bc0524877943fe86e43087e7a/internal_photos/bs/2018/l/b/AyCpHmQYq70WvFk9QZBA/lsev-carro-impresso-em-3d-1.png",
                //     ),
                //   ],
                // ),
              ),
            ),
          )
        ],
      ),
    );
  }
}