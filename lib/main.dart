import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'About Page',
      theme: ThemeData(
        fontFamily: 'Open Sans', 
      ),
      home: Scaffold(
        body: Stack(
          children: [
            
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/beach.png"), 
                  fit: BoxFit.cover,
                ),
              ),
            ),
            
            Positioned(
              top: 0, 
              left: 0,
              right: 0,
              child: Container(
                height: 50,
                color: Colors.white, 
                child: Center(
                  child: Text(
                    "About", 
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 69, 190, 246), 
                    ),
                  ),
                ),
              ),
            ),
            
            Positioned(
              top: MediaQuery.of(context).size.height * 0.125, 
              left: 0,
              right: 0,
              child: Center(
                child: Text(
                  "Hello World :)", 
                  style: TextStyle(
                    fontSize: 24,
                    fontStyle: FontStyle.italic,
                    color: Colors.white, 
                    shadows: [
                      Shadow(
                        blurRadius: 10.0, 
                        color: Colors.black.withOpacity(0.5), 
                        offset: Offset(2.0, 2.0), 
                      ),
                    ],
                  ),
                ),
              ),
            ),
            
            const PositionedBox(),
            
            const PositionedCircle(),
            
            const PositionedInfo(),
          ],
        ),
      ),
    );
  }
}


class PersonInfo {
  final String name;
  final String nrp;
  final List<String> funFacts; 

  PersonInfo({required this.name, required this.nrp, required this.funFacts});
}


final person = PersonInfo(
  name: "Anisa Rahmah",
  nrp: "5026211040",
  funFacts: [
    "Enjoy drawing and coloring, and I always feel pleased with the results.",
    "Music is something I always listen to, as I enjoy having it on at any time.",
    "I like organizing things because I feel more comfortable in a tidy space."
  ],
);

class PositionedBox extends StatelessWidget {
  const PositionedBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(30, 30, 30, 30), 
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.65, 
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.85), 
            border: Border.all(
              color: Colors.white, 
              width: 1, 
            ),
            borderRadius: BorderRadius.circular(20), 
          ),
        ),
      ),
    );
  }
}

class PositionedCircle extends StatelessWidget {
  const PositionedCircle({super.key});

  @override
  Widget build(BuildContext context) {
    double circleDiameter = 140;
    double screenWidth = MediaQuery.of(context).size.width;

    return Positioned(
      top: MediaQuery.of(context).size.height * 0.225, 
      left: (screenWidth - circleDiameter) / 2, 
      child: Container(
        width: circleDiameter, 
        height: circleDiameter, 
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: AssetImage("images/anisa.png"), 
            fit: BoxFit.cover,
          ),
          border: Border.all(
            color: Colors.white, 
            width: 3, 
          ),
        ),
      ),
    );
  }
}

class PositionedInfo extends StatelessWidget {
  const PositionedInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).size.height * 0.415, 
      left: 30, 
      right: 30, 
      child: Padding(
        padding: const EdgeInsets.all(20), 
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              person.name, 
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: const Color.fromARGB(255, 56, 56, 56), 
              ),
            ),
            const SizedBox(height: 1),
            Text(
              "${person.nrp}", 
              style: TextStyle(
                fontSize: 16,
                color: const Color.fromARGB(255, 52, 52, 52), 
              ),
            ),
            const SizedBox(height: 14),
            
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20), 
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.85),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.white, width: 1),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  
                  Text(
                    "Fun Facts", 
                    style: TextStyle(
                      fontSize: 18,
                      fontStyle: FontStyle.italic,
                      color: const Color.fromARGB(255, 60, 60, 60), 
                    ),
                  ),
                  const SizedBox(height: 8),
                  
                  ...List.generate(person.funFacts.length, (index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Text(
                        "${index + 1}. ${person.funFacts[index]}", 
                        style: TextStyle(
                          fontSize: 14,
                          color: const Color.fromARGB(255, 60, 60, 60), 
                        ),
                      ),
                    );
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
