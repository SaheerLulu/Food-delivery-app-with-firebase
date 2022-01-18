import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/colors.dart';
import 'package:flutter_application_1/models/food.dart';

class FoodItem extends StatefulWidget {
  final Food food;
    FoodItem(this.food);

  @override
  State<FoodItem> createState() => _FoodItemState();
}

class _FoodItemState extends State<FoodItem> {
  bool _addShow = false;
  bool _addButton = true;
  num _counter = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(5),
            width: 110,
            height: 110,
            child: Image.asset(widget.food.imgUrl!, fit: BoxFit.fitHeight),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(top: 20, left: 10, right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(widget.food.name!,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              height: 1.5)),
                    ],
                  ),
                  Text(
                    widget.food.desc!,
                    style: TextStyle(
                      color: widget.food.highLight!
                          ? kPrimaryColor
                          : Colors.grey.withOpacity(0.8),
                      height: 1.5,
                    ),
                  ),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          child: Row(children: [
                        Text(
                          '\$',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '${widget.food.price}',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ])),
                      SizedBox(
                        width: 40,
                      ),
                      Visibility(
                        visible: _addButton,
                        child: Expanded(
                            child: InkWell(
                          onTap: () {
                            setState(() {
                              _addButton = false;
                              _addShow = true;
                              _counter+=1;
                            });
                          },
                          child: Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: Text("Add"),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Icon(
                                    Icons.add_outlined,
                                    size: 17,
                                  ),
                                ),
                              ],
                            ),
                            height: 30,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: kPrimaryColor),
                                color: kPrimaryColor),
                          ),
                        )),
                      ),
                      Visibility(
                        visible: _addShow,
                        child: Expanded(
                            child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        if (_counter >= 2) {
                                          _counter -= 1;
                                        } else {
                                          _counter = 0;
                                          _addButton = true;
                                          _addShow = false;
                                        }
                                      });
                                    },
                                    child: Icon(
                                      Icons.remove_outlined,
                                      size: 20,
                                    )),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text(
                                  "$_counter",
                                  style: TextStyle(fontSize: 12),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        _counter += 1;
                                      });
                                    },
                                    child: Icon(
                                      Icons.add_outlined,
                                      size: 20,
                                    )),
                              ),
                            ],
                          ),
                          height: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: kPrimaryColor),
                          ),
                        )),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
