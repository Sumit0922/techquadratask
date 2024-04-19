import 'package:flutter/material.dart';
import 'package:petshop/Ui/availability_screen_ui/addavailabilityscreen.dart';

class AvailabilityScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Availability'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddAvailabilityScreen()),
              );
            },
            child: Text(
              '+Add Shift',
              style: TextStyle(
                color: Colors.red.shade700,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: EdgeInsets.all(16.0),
          height: MediaQuery.of(context).size.height*0.3,
          decoration: BoxDecoration(

            border: Border.all(
              color: Colors.white,
              width: 1.0,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Shift-1',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.more_vert_rounded),
                    onPressed: () {

                    },
                    color: Colors.white,
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'From',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      Container(
                        width: 120,
                        height: 40,

                        decoration: BoxDecoration(
                            color: Colors.grey.shade600,
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '6:53 AM',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Icon(
                              Icons.access_time,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'To',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      Container(
                        width: 120,
                        height: 40,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade600,
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '6:52 PM',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Icon(
                              Icons.access_time,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              Text(
                'Selected Days',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                ),
              ),
              SizedBox(height: 16.0),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 7,
                        itemBuilder: (BuildContext context, int index) {
                          List<String> days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
                          return CircleAvatar(

                            child: Text(days[index],style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                            radius: 30,

                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }
}
