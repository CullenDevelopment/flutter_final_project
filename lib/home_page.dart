import 'package:age/age.dart';
import 'package:flutter/material.dart';
import 'package:flutter_final_project/age_calculation.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime todaysDate = DateTime.now();
  DateTime dob=DateTime(2000,1,1);
  AgeDuration _ageDuration;
  AgeDuration _nextBirthdate;
  int _nextBirthdayWeekday;

  List<String> _months=[
    "months",
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December" ];

  List<String> _weeks = [
    "weeks",
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
    "Sunday",
  ];

  Future<Null> _selectTodaysDate(BuildContext context) async{
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: todaysDate,
      firstDate: dob,
      lastDate: DateTime(2101),
    );
    if(picked != null && picked != todaysDate){
      setState(() {
        todaysDate=picked;
        _ageDuration = AgeCalculation().calculateAge(todaysDate, dob);
        _nextBirthdate = AgeCalculation().nextBirtday(todaysDate, dob);
        _nextBirthdayWeekday = AgeCalculation().nextBdayWeekdate(todaysDate, dob);
      });
    }
  }

  Future<Null> _selectDOBDate(BuildContext context) async{
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: dob,
      firstDate: DateTime(1900),
      lastDate: todaysDate,
    );
    if(picked != null && picked != dob){
      setState(() {
        dob=picked;
        _ageDuration = AgeCalculation().calculateAge(todaysDate, dob);
        _nextBirthdate = AgeCalculation().nextBirtday(todaysDate, dob);
        _nextBirthdayWeekday = AgeCalculation().nextBdayWeekdate(todaysDate, dob);
      });
    }
  }

  @override
  void initState(){
    super.initState();
    _ageDuration = AgeCalculation().calculateAge(todaysDate, dob);
    _nextBirthdate = AgeCalculation().nextBirtday(todaysDate, dob);
    _nextBirthdayWeekday = AgeCalculation().nextBdayWeekdate(todaysDate, dob);
  }
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.black,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal:15),
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                  width: double.maxFinite,
                ),
                Text("AGE CALCULATOR",style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                ),
                ),SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Today",style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 22,
                      ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Row(
                        children: [
                          Text("${todaysDate.day} ${_months[todaysDate.month]} ${todaysDate.year}",
                          style: TextStyle(
                            color: Color(0xffCDDC39),
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                          ),
                          ),
                          SizedBox(
                            height:40,
                          ),

                          GestureDetector(
                            onTap:(){
                              _selectTodaysDate(context);
                            },
                            child: Icon(Icons.calendar_today,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Date of Birth",style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 22,
                      ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Row(
                        children: [
                          Text("${dob.day} ${_months[dob.month]} ${dob.year}",
                            style: TextStyle(
                              color: Color(0xffCDDC39),
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(
                            height:30,
                          ),
                          GestureDetector(
                            onTap: (){
                              _selectDOBDate(context);
                              },
                            child: Icon(Icons.calendar_today,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                    vertical: 40,
                  ),
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    color: Color(0xff333333),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: 200,
                            padding: EdgeInsets.symmetric(
                              vertical: 20,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("AGE", style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                ),
                                ),
                                Row(

                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text("${_ageDuration.years}",
                                      style: TextStyle(
                                      color: Color(0xffCDDC39),
                                      fontSize: 76,
                                      fontWeight: FontWeight.w700,
                                    ),
                                    ),
                                    Padding(
                                        padding: EdgeInsets.only(bottom: 13,
                                        ),
                                    child: Text("YEARS",style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 22,
                                      fontWeight: FontWeight.w700,
                                    ),
                                    ),
                                    ),
                                  ],
                                ),
                                Text("${_ageDuration.months} months | ${_ageDuration.days} days",
                                  style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 160,
                            width: 1,
                            color: Color(0xff999999),
                          ),
                          Container(
                            height: 200,
                            padding: EdgeInsets.symmetric(
                              vertical: 20,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("NEXT BIRTHDAY", style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
                                ),

                                Icon(Icons.cake, color: Color(0xffCDDC39),
                                  size: 40,
                                ),
                                Text("${_weeks[_nextBirthdayWeekday]}", style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w700,
                                ),
                                ),
                                Text("${_nextBirthdate.months} Months | ${_nextBirthdate.days} days}",
                                  style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                ),
                                ),
                              ],
                            ),
                          ),

                        ],
                      ),
                      Container(
                        height: 1,
                        width: double.maxFinite,
                        color: Color(0xff999999),
                        margin: EdgeInsets.symmetric(horizontal: 15),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20,
                        ),
                        child: Text("SUMMARY", style: TextStyle(
                          color: Color(0xffCDDC39),
                          fontWeight: FontWeight.w700,
                          fontSize:18,
                        ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal:35),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text("YEARS", style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400 ,
                                ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text("${_ageDuration.years}", style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 28,
                                  fontWeight: FontWeight.w400 ,
                                ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text("MONTHS", style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400 ,
                                ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text("${((_ageDuration.years)*12) + (_ageDuration.months)}", style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 28,
                                  fontWeight: FontWeight.w400 ,
                                ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text("WEEKS", style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400 ,
                                ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text("${(todaysDate.difference(dob).inDays/7).floor()}", style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 28,
                                  fontWeight: FontWeight.w400 ,
                                ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal:35),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text("DAYS", style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400 ,
                                ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text("${todaysDate.difference(dob).inDays}", style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400 ,
                                ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text("HOURS", style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400 ,
                                ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text("${todaysDate.difference(dob).inHours}", style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400 ,
                                ),
                                ),

                              ],
                            ),
                            Column(
                              children: [
                                Text("MINUTES", style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400 ,
                                ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text("${todaysDate.difference(dob).inMinutes}", style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400 ,
                                ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        )
    );
  }
}
