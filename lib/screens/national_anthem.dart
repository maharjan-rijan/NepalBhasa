import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nepal_bhasa/main.dart';

class NationalAnthemPage extends StatelessWidget {
  const NationalAnthemPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: CustomAppBar(
        bottomTitle: 'राष्ट्रिय गान / National Anthem / राष्ट्रिय म्येः',
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Align(
          alignment: Alignment.center,
          child: Column(
            children: [
              SvgPicture.asset(
                'assets/svgicons/map.svg',
                height: 180,
                fit: BoxFit.contain,
              ),
              SizedBox(height: 20),
              //               Container(
              //                 decoration: BoxDecoration(
              //                   color: Colors.white60,
              //                   border: Border.all(width: 1),
              //                   borderRadius: BorderRadius.circular(12),
              //                 ),
              //                 child: Text(
              //                   '''
              // सयौं थुँगा फूलका हामी, एउटै माला नेपाली
              // सार्वभौम भई फैलिएका, मेची-महाकाली।

              // प्रकृतिका कोटि-कोटि सम्पदाको आँचल
              // वीरहरूका रगतले स्वतन्त्र र अटल।

              // ज्ञानभूमि, शान्तिभूमि, तराई, पहाड, हिमाल
              // अखण्ड यो प्यारो हाम्रो मातृभूमि नेपाल।

              // बहुल जाति, भाषा, धर्म, संस्कृति छन् विशाल
              // अग्रगामी राष्ट्र हाम्रो, जय जय नेपाल।।''',
              //                   style: TextStyle(
              //                     fontSize: 20,
              //                     fontFamily: 'Preeti',
              //                     fontWeight: FontWeight.w400,
              //                   ),
              //                   textAlign: TextAlign.center,
              //                 ),
              //               ),
              //               SizedBox(height: 10),
              Text(
                '''
धुन दनेधुन सँन्ह्यलं झी 
फुक्क हे छम्ह जुइधुन 
झीगु लागाय् झी स्वयम हे 
जः जुयाः धुन लुइधुन 
              
    ह्याँउगु भूमिइ अष्टमण्डल 
    ह्याँउगु चाः दुने थी नगु 
    झीगु नेवाः ध्वाँय् थ्वहे खः 
    ज्यान झी सकस्यां छगू 
                        
जातितय् स्वायत्त राज्यं 
लुइ कपं च्वय् झिलिमिलिं 
राष्ट्र झःझः धायक न्ह्याके 
झीगु चःतिं झीगु हिं ''',
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Preeti',
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(currentIndex: 0,),
    );
  }
}
