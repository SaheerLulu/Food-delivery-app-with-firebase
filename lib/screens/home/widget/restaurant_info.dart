import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/colors.dart';
import 'package:flutter_application_1/models/restaurant.dart';

class RestaurantInfo extends StatelessWidget {
  final restaurant = Restaurant.generateRestaurant();
  

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top:40),
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    restaurant.name,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.8),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          restaurant.waitTime,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            //fontWeight: FontWeight.bold,
                            ),
                        )
                      ),
                      SizedBox(width: 10),
                      Text(
                        restaurant.distance,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.withOpacity(0.4)

                        ),
                      ),
                      SizedBox(width: 10),
                      Text(
                        restaurant.label,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.withOpacity(0.4)
                        ),
                      ),
                    ],
              )
                ],                
              ),
              
              ClipRRect(
                borderRadius: BorderRadius.circular(50),        
                child: Image.asset(restaurant.logoUrl,
                width: 80,)
                ),

            ],
          ),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                restaurant.desc,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              Row(
                children: [
                  Icon(
                    Icons.star_outline,
                    color: kPrimaryColor,
                  ),
                  Text(
                    "${restaurant.score}",
                    style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                ],
              ),
              
              
            ],

          ),
        ],
      ),
       
    );
  }
}