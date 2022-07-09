import 'package:flutter/material.dart';
import 'package:medogo/constants.dart';
import 'package:medogo/utilities/space.dart';
import 'package:medogo/utilities/doctor_card.dart';

class ParticularSpecialist extends StatefulWidget {
  final String specialist;
  final String specialistImage;
  const ParticularSpecialist({Key? key,
  required this.specialist,
  required this.specialistImage}): super(key: key);
  @override 
  _ParticularSpecialistState createState() => _ParticularSpecialistState();
}

class _ParticularSpecialistState extends State<ParticularSpecialist> {
  final String dummytext = "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Maecenas nec odio et ante tincidunt tempus. Donec vitae sapien ut libero venenatis faucibus. Nullam quis ante. Etiam sit amet orci eget eros faucibus tincidunt. Duis leo. Sed fringilla mauris sit amet nibh. Donec sodales sagittis magna. Sed consequat, leo eget bibendum sodales, augue velit cursus nunc,";
  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: CustomScrollView(
  slivers: <Widget>[
     SliverAppBar(
      pinned: true,
      expandedHeight: 500.0,
      backgroundColor: kBackgroundLightColor,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(widget.specialist, style: const TextStyle(color: kPrimaryColor, fontWeight: FontWeight.w900)),
        centerTitle: true,
        background: Hero(
          tag: "${widget.specialist}SpecialistImage",
          child: Image.asset(widget.specialistImage),
        ),
      ),
    ),

     SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child:  Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget> [
                          const AddSpace(verticalSpace: 30.0),
                          Text("Who are ${widget.specialist}?", 
                          textAlign: TextAlign.center, style: const TextStyle(
                            color: kPrimaryColor, 
                            fontWeight: FontWeight.bold, 
                            fontSize: 35.0)),
                            Text(dummytext, 
                            textAlign: TextAlign.justify,
                            style: const TextStyle(color: kTextColor,
                            fontSize: 20.0)),
                             Text("When to approach ${widget.specialist}?", 
                          textAlign: TextAlign.center, style: const TextStyle(
                            color: kPrimaryColor, 
                            fontWeight: FontWeight.bold, 
                            fontSize: 35.0)),
                            Text(dummytext, 
                            textAlign: TextAlign.justify,
                            style: const TextStyle(color: kTextColor,
                            fontSize: 20.0)),
                            const AddSpace(verticalSpace: 20.0),
                             Container(
                              margin: const EdgeInsets.all(2.0),
                              padding: const EdgeInsets.all(15.0),
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                color: kBackgroundLightColor,
                              ),
                              child: Text("Our Top ${widget.specialist}",
                              textAlign: TextAlign.center,
                              style: const TextStyle(color: kPrimaryColor, fontSize: 30.0)),
                            ),
                            const AddSpace(verticalSpace: 20.0),
                            DoctorCard(doctorName: "Doctor Name One Surname One", doctorImage: "doctor1.jpg", fees: 500, distance: 2.3, rating: 4.6, specialisation: widget.specialist, specialistImage: widget.specialistImage),
                            DoctorCard(doctorName: "Doctor Name Two Surname Two", doctorImage: "doctor2.jpg", fees: 1000, distance: 7.1, rating: 4.8, specialisation: widget.specialist, specialistImage: widget.specialistImage),
                            DoctorCard(doctorName: "Doctor Name Three Surname Three", doctorImage: "doctor3.jpg", fees: 600, distance: 4.4, rating: 3.1, specialisation: widget.specialist, specialistImage: widget.specialistImage),
                            DoctorCard(doctorName: "Doctor Name Four Surname Four", doctorImage: "doctor4.jpg", fees: 300, distance: 0.25, rating: 3.3, specialisation: widget.specialist, specialistImage: widget.specialistImage),
                            DoctorCard(doctorName: "Doctor Name Five Surname Five", doctorImage: "doctor5.jpg", fees: 800, distance: 9.6, rating: 2.9, specialisation: widget.specialist, specialistImage: widget.specialistImage),
                                      ],
                      ),
              );
            },
            childCount: 1,
          ),
        ),
  
  ],
),
    );
  }
}

