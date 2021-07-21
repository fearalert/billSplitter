import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tipcalculator/components/customButton.dart';
import 'package:tipcalculator/components/customTextField.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double billAmt = 0;
  double tipAmt = 0;
  int person = 1;
  double tipPerPerson = 0;
  double totalPerPerson = 0;
  double selectedPercentage = 0;

  TextStyle titleStyle = TextStyle(
    fontSize: 20.0,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w600,
    // color: Color(0xff8c9292),
    color: Colors.black,
  );

  //text editing controllers
  TextEditingController billController = TextEditingController();
  TextEditingController tipController = TextEditingController();
  TextEditingController numberController = TextEditingController();

  void calcluate() {
    double amount = billAmt * tipAmt;
    double amountSecond = billAmt * (1 + tipAmt);
    tipPerPerson = amount / person;
    totalPerPerson = amountSecond / person;
    selectedPercentage = tipAmt * 100;
  }

  void display() {
    selectedPercentage = tipAmt * 100;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffc5e4e7),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 200,
              color: Colors.transparent,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'T I P',
                      style: titleStyle,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'C A L C U L A T O R',
                        style: titleStyle,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 6.0,
              ),
              child: Container(
                width: double.infinity,
                // height: 750,
                padding: EdgeInsets.symmetric(
                  vertical: 25.0,
                  horizontal: 25.0,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(35.0),
                    topRight: Radius.circular(35.0),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Bills',
                      style: titleStyle,
                    ),
                    SizedBox(
                      child: Divider(
                        color: Colors.black,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: CustomTextField(
                        hintText: 'eg, 142.55',
                        textAlign: TextAlign.end,
                        controller: billController,
                        prefixIcon: Icon(
                          Icons.attach_money_rounded,
                        ),
                        onEditingComplete: () {
                          setState(() {
                            if (billController.text.isNotEmpty) {
                              billAmt = (double.parse(billController.text));
                            } else {
                              billAmt = 0.0;
                            }
                            FocusScope.of(context).unfocus();
                            // calcluate();
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      height: 40.0,
                    ),
                    Text(
                      'Select Tip\'s %',
                      style: titleStyle,
                    ),
                    SizedBox(
                      child: Divider(
                        color: Colors.black,
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: CustomButton(
                            onButtonPressed: () {
                              setState(() {
                                tipAmt = 5 / 100;
                                display();
                              });
                            },
                            primaryColour: Color(0xff02484b),
                            buttonText: '5%',
                          ),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Expanded(
                          child: CustomButton(
                            onButtonPressed: () {
                              setState(() {
                                tipAmt = 10 / 100;
                                display();
                              });
                            },
                            primaryColour: Color(0xff02484b),
                            buttonText: '10%',
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: CustomButton(
                            onButtonPressed: () {
                              setState(() {
                                tipAmt = 20 / 100;
                                display();
                              });
                            },
                            primaryColour: Color(0xff02484b),
                            buttonText: '20%',
                          ),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Expanded(
                          child: CustomButton(
                            onButtonPressed: () {
                              setState(() {
                                tipAmt = 25 / 100;
                                display();

                                // calcluate();
                              });
                            },
                            primaryColour: Color(0xff02484b),
                            buttonText: '25%',
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: CustomButton(
                            onButtonPressed: () {
                              setState(() {
                                tipAmt = 50 / 100;
                                display();
                              });
                            },
                            primaryColour: Color(0xff02484b),
                            buttonText: '50%',
                          ),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Expanded(
                          child: CustomTextField(
                            hintText: 'CUSTOM',
                            textAlign: TextAlign.center,
                            controller: tipController,
                            prefixIcon: Icon(
                              Icons.border_color_rounded,
                            ),
                            onEditingComplete: () {
                              setState(() {
                                if (tipController.text.isNotEmpty) {
                                  tipAmt =
                                      double.parse(tipController.text) / 100;
                                } else {
                                  tipAmt = 0.0;
                                }
                                FocusScope.of(context).unfocus();
                                display();
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    Text(
                      '$selectedPercentage % tip is selected',
                      style: TextStyle(
                        color: Color(0xff27c3ae),
                      ),
                    ),
                    SizedBox(height: 25.0),
                    Text(
                      'Number of people',
                      style: titleStyle,
                    ),
                    SizedBox(
                      child: Divider(
                        color: Colors.black,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: CustomTextField(
                        hintText: 'eg. 5',
                        textAlign: TextAlign.end,
                        controller: numberController,
                        prefixIcon: Icon(
                          Icons.person_rounded,
                        ),
                        onEditingComplete: () {
                          setState(() {
                            if (numberController.text.isNotEmpty) {
                              person = int.parse(numberController.text);
                            } else {
                              person = 1;
                            }
                            FocusScope.of(context).unfocus();
                            // calcluate();
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                        vertical: 25.0,
                        horizontal: 20.0,
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xff01474a),
                        borderRadius: BorderRadius.all(
                          Radius.circular(16.0),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Tip Amount',
                                    style: GoogleFonts.shortStack(
                                      color: Color(0xffffffff),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0,
                                    ),
                                  ),
                                  SizedBox(height: 2.0),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Text(
                                      '/ person',
                                      style: GoogleFonts.roboto(
                                        color: Color(0xFF9E8D8D),
                                        fontWeight: FontWeight.normal,
                                        fontStyle: FontStyle.italic,
                                        fontSize: 16.0,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                '\$ ${tipPerPerson.toStringAsFixed(2)}',
                                style: GoogleFonts.montserrat(
                                  color: Color(0xff27c3ae),
                                  fontWeight: FontWeight.normal,
                                  fontStyle: FontStyle.italic,
                                  fontSize: 25.0,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Total Bill',
                                    style: GoogleFonts.shortStack(
                                      color: Color(0xffffffff),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0,
                                    ),
                                  ),
                                  SizedBox(height: 2.0),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Text(
                                      '/ person',
                                      style: GoogleFonts.roboto(
                                        color: Color(0xFF9E8D8D),
                                        fontWeight: FontWeight.normal,
                                        fontStyle: FontStyle.italic,
                                        fontSize: 16.0,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                '\$ ${totalPerPerson.toStringAsFixed(2)}',
                                style: GoogleFonts.montserrat(
                                  color: Color(0xff27c3ae),
                                  fontWeight: FontWeight.normal,
                                  fontStyle: FontStyle.italic,
                                  fontSize: 25.0,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: CustomButton(
                                  onButtonPressed: () {
                                    setState(() {
                                      tipAmt = 0.0;
                                      billAmt = 0.0;
                                      person = 1;
                                      billController.clear();
                                      tipController.clear();
                                      numberController.clear();

                                      calcluate();
                                    });
                                  },
                                  primaryColour: Color(0xff27c3ae),
                                  buttonText: 'Reset',
                                ),
                              ),
                              Expanded(
                                child: CustomButton(
                                  onButtonPressed: () {
                                    setState(() {
                                      calcluate();
                                    });
                                  },
                                  primaryColour: Color(0xff27c3ae),
                                  buttonText: 'Calculate',
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
            ),
          ],
        ),
      ),
    );
  }
}
