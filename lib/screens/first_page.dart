import 'package:flutter/material.dart';
import 'package:pbl_fitness_app/screens/home_screen.dart';

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      color: Colors.grey,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          ClipRRect(
            clipBehavior: Clip.antiAlias,
            borderRadius: BorderRadius.circular(15),
            child: Center(
              child: Image.asset(
                'assets/images/gym/gym.jpg',
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width,
              ),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              splashFactory: InkRipple.splashFactory, backgroundColor: Theme.of(context).primaryColor,
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => HomeScreen()));
            },
            child: Text(
              'Click here to proceed',
              style: TextStyle(
                fontSize: 25,
                color: Colors.white,
              ),
            ),
            // child: Text(
            //     'Click here to proceed'
            // ),
          ),
        ],
      ),
      // child: RaisedButton(
      //   onPressed: (){
      //     Navigator.push(
      //         context,MaterialPageRoute(builder: (BuildContext context) => HomeScreen()));
      //   },
      //   child: Text('Click here to proceed'),
      // ),
    );
  }
}
