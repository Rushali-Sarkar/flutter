import 'package:flutter/material.dart';
import 'package:medogo/constants.dart';
import 'package:medogo/screens/particular_specialist_page.dart';
import 'package:medogo/utilities/space.dart';


class SpecialistDoctors extends StatefulWidget {
  static String id = "SpecialistDoctors";
  const SpecialistDoctors({Key? key}): super(key: key);
  @override 
  _SpecialistDoctorState createState() => _SpecialistDoctorState();
}

class _SpecialistDoctorState extends State<SpecialistDoctors> with SingleTickerProviderStateMixin {
  
 @override 
 void initState() {
    super.initState();
   
 }

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        backgroundColor:kBackgroundLightColor,
        centerTitle: false,
        title: const Text("Specializations", style: TextStyle(color: kPrimaryColor, fontSize: 20.0)),
        elevation: 10.0,
        actions: [
          InkWell(
            onTap: () {},
            child: const Icon(Icons.shield,
            size: 35.0)
          ),
          const AddSpace(horizontalSpace: 10.0),
          InkWell(
            onTap: () {},
            child: const Icon(Icons.notifications,
            size: 35.0)
          ),
          const AddSpace(horizontalSpace: 10.0),
          InkWell(
            onTap: () {},
            child: const CircleAvatar(
              backgroundImage: AssetImage("images/user.jpg"),
            ),
          ),
        ],
      ),
      backgroundColor: kBackgroundColor,
      body: CustomScrollView(
        slivers: <Widget>[
           SliverGrid(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 350.0,
              mainAxisSpacing: 1.0,
              crossAxisSpacing: 1.0,
              childAspectRatio: 0.6,
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => 
                      ParticularSpecialist(specialist: kNames[index], specialistImage: "images/specialists/${kImages[index]}.png",)));
                    },
                    child: Container(
                      height: 300.0,
                      width: 300.0,
                      color: kBackgroundLightColor,
                      margin: const EdgeInsets.all(10.0),
                      child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Hero(
                      tag: "${kNames[index]}SpecialistImage",
                      child: Container(
                    margin: const EdgeInsets.all(10.0),
                    padding: const EdgeInsets.all(10.0),
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      image: DecorationImage(image: 
                      AssetImage("images/specialists/${kImages[index]}.png"),),
                    ),
                  ),
                    ),
                    Text(kNames[index], textAlign: TextAlign.center, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0, color: kPrimaryColor))

                      ],
                    ),
                    ),
                  );
                    },
                    childCount: kImages.length)),
                    
        ],
      ),
    );
  }

}