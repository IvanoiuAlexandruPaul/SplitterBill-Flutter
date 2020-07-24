import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'CoinData.dart';
import 'RoundIconButton.dart';

class SecondPage extends StatefulWidget {
  @override
  _MainSecondState createState() => _MainSecondState();
}

class _MainSecondState extends State<SecondPage> {
  int priceBill = 100;
  int people_number = 1;
  int tip_number = 0;
  String currencySelected = 'USD';

  //Tip Calculation
  String TotalCostPerPerson() {
    var temporariTip = tip_number / 100;
    var actualTip = priceBill * temporariTip;
    var totalCost = (actualTip + priceBill) / people_number;

    return totalCost.toStringAsFixed(2);
  }

  //This method allows me to create a DropdownButton that contains all the currencies
  DropdownButton<String> CreateList() {
    List<DropdownMenuItem<String>> currenciesListToShow = [];
    for (String actualValue in currenciesList) {
      var item = DropdownMenuItem(
        child: Text(actualValue),
        value: actualValue,
      );
      currenciesListToShow.add(item);
    }
    return DropdownButton(
      style: TextStyle(
          color: Colors.black, fontSize: 30, fontWeight: FontWeight.w500),
      value: currencySelected,
      items: currenciesListToShow,
      onChanged: (value) {
        setState(() {
          currencySelected = value;
        });
      },
    );
  }

  CupertinoPicker iOSPicker() {
    List<Text> pickerItems = [];
    for (String currency in currenciesList) {
      pickerItems.add(Text(currency));
    }

    return CupertinoPicker(
      backgroundColor: Colors.black,
      itemExtent: 30.0,
      onSelectedItemChanged: (selectedIndex) {
        setState(() {
          currencySelected = currenciesList[selectedIndex];
        });
      },
      children: pickerItems,
    );
  }

  //Display the number of people
  String DisplayPeople() {
    if (people_number < 1) {
      people_number = 1;
    }

    return people_number.toString();
  }

  //Display the number of people
  String DisplaTip() {
    if (tip_number < 0) {
      tip_number = 0;
    }

    return tip_number.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFAFAFA),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 80,
                    width: 390,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      color: Color(0xFFEF4C52),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              'Currency : ',
                              style: TextStyle(
                                  fontFamily: 'BabesNeue',
                                  fontSize: 40,
                                  color: Colors.white),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Platform.isIOS ? iOSPicker() : CreateList(),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        color: Color(0xFF2BBD7E)),
                    height: 170,
                    width: 170,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Text(
                          'PEOPLE',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF707070),
                            fontSize: 20,
                            fontFamily: 'BabesNeue',
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              DisplayPeople(),
                              style: TextStyle(
                                color: Color(0xFF707070),
                                fontSize: 70,
                                fontFamily: 'BabesNeue',
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Flexible(
                              child: RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                function: () {
                                  setState(() {
                                    people_number++;
                                  });
                                },
                              ),
                            ),
                            Flexible(
                              child: RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                function: () {
                                  setState(() {
                                    people_number--;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    margin: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        color: Color(0xFF2BBD7E)),
                    height: 170,
                    width: 170,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Text(
                          'TIP',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF707070),
                            fontSize: 20,
                            fontFamily: 'BabesNeue',
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              DisplaTip(),
                              style: TextStyle(
                                color: Color(0xFF707070),
                                fontSize: 70,
                                fontFamily: 'BabesNeue',
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Flexible(
                              child: RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                function: () {
                                  setState(() {
                                    tip_number++;
                                  });
                                },
                              ),
                            ),
                            Flexible(
                              child: RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                function: () {
                                  setState(() {
                                    tip_number--;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 147,
                    width: 390,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      color: Color(0xFFEF4C52),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'PRICE',
                          style: TextStyle(
                              fontFamily: 'BabesNeue',
                              fontSize: 20,
                              color: Colors.white),
                        ),
                        Text(
                          priceBill.toString(),
                          style: TextStyle(
                              fontFamily: 'BabesNeue',
                              fontSize: 50,
                              color: Colors.white),
                        ),
                        Slider(
                          activeColor: Colors.white,
                          value: priceBill.toDouble(),
                          min: 1.0,
                          max: 1000.0,
                          inactiveColor: Colors.grey,
                          onChanged: (value) {
                            setState(() {
                              priceBill = value.toInt();
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 147,
                    width: 390,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      color: Color(0xFFBEBEBE),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              TotalCostPerPerson(),
                              style: TextStyle(
                                  fontFamily: 'BabesNeue',
                                  fontSize: 50,
                                  color: Colors.white),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              currencySelected,
                              style: TextStyle(
                                  fontFamily: 'BabesNeue',
                                  fontSize: 50,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                        Text(
                          '/ PERSON',
                          style: TextStyle(
                              fontFamily: 'BabesNeue',
                              fontSize: 40,
                              color: Color(0xFF707070)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
