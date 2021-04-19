import 'package:age/age.dart';

class AgeCalculation{
  //Calculate age of a person
  calculateAge(DateTime today, DateTime birthday){
    AgeDuration age;
    age = Age.dateDifference(fromDate: birthday, toDate: today, includeToDate: false);
    return age;
  }
  //Calculate time to next birthday
  AgeDuration nextBirtday(DateTime today, DateTime birthday){
    DateTime temp = DateTime(today.year, birthday.month, birthday.day);

    DateTime nextBirthdayDate = temp.isBefore(today)
        ? Age.add(date: temp, duration: AgeDuration(years: 1))
        :temp;

    AgeDuration nextBirthdayDuration = Age.dateDifference(fromDate: today,
        toDate: nextBirthdayDate);
    return nextBirthdayDuration;

  }

  // Calculate next Birthday week day
  int nextBdayWeekdate(DateTime today, DateTime birthday){
    DateTime temp = DateTime(today.year, birthday.month, birthday.day);

    DateTime nextBirthdayDate = temp.isBefore(today)
        ? Age.add(date: temp, duration: AgeDuration(years: 1))
        :temp;

    return nextBirthdayDate.weekday;

  }

}