import 'Trip.dart';
import 'dart:io';

void main(List<String> arguments) {
  runApp();
}

var trips = <Trip>[];
List<int> passengerList = List(trips.length);

void runApp() {
  print('1 : Add Trip \n'
      '2 : Edit Trip \n'
      '3 : Delete Trip \n'
      '4 : View Trip \n'
      '5 : Search Trip \n'
      '6 : reverse \n'
      '7 : Discount \n'
      '8 : Latest Trip \n'
      '9 : View Passengers');
  var choice;
  choice = intInputHelper(choice);
  switch (choice) {
    case 1:
      addTrip();
      break;
    case 2:
      editTrip();
      break;
    case 3:
      deleteTrip();
      break;
    case 4:
      viewTrip();
      break;
    case 5:
      searchTrip();
      break;
    case 6:
      reverse();
      break;
    case 7:
      discount();
      break;
    case 8:
      latestTrip();
      break;
    case 9:
      viewPassengers();
      break;
    default:
      {
        print('Wrong Choice ! \n'
            'Please Press Number Between 1 : 9 ');
        runApp();
      }
  }
}

void addTrip() {
  var id, passengerLimit, location, price, date;

  print('Please Enter Trip ID :');
  id = intInputHelper(id);
  print('Please Enter Passenger Limit :');
  passengerLimit = intInputHelper(passengerLimit);
  print('Please Enter Location :');
  location = stdin.readLineSync();
  print('Please Enter Trip Price : ');
  price = doubleInputHelper(price);
  print('Please Enter Trip Date (YYYY - MM - DD ): ');
  date = dateInputHelper(date);

  trips.add(Trip(id, passengerLimit, location, price, date));
  print('Done !!\n');
  runApp();
}

void editTrip() {
  checkEmptyTrips();
  showTrips();
  var id, passengerLimit, location, price, date, editTripID, editID, choice;
  print('\n Select Trip To Edit By ID !');
  editTripID = intInputHelper(editTripID);

  for (var i = 0; i < trips.length; i++) {
    editID = trips[i].getId();
    if (editID == editTripID) {
      print('Please Enter your Choice For Edit: \n'
          '1 : ID \n'
          '2 : Passenger Limit  \n'
          '3 : Location  \n'
          '4 : Price \n'
          '5 : Date \n ');
      choice = intInputHelper(choice);
      switch (choice) {
        case 1:
          print('Enter New ID :');
          id = intInputHelper(id);
          trips[i].setId(id);
          break;
        case 2:
          print('Enter New Passenger Limit :');
          passengerLimit = intInputHelper(passengerLimit);
          trips[i].setPassengerLimit(passengerLimit);
          break;
        case 3:
          print('Enter New Location :');
          location = stdin.readLineSync();
          trips[i].setLocation(location);
          break;
        case 4:
          print('Enter New Price :');
          price = doubleInputHelper(price);
          trips[i].setPrice(price);
          break;
        case 5:
          print('Enter New Date :');
          date = dateInputHelper(date);
          trips[i].setDate(date);
          break;
        default:
          print('Wrong Choice !!'
              'Try Again');
          editTrip();
      }
    }
  }
  runApp();
}

void deleteTrip() {
  checkEmptyTrips();
  showTrips();
  var deleteTrip, deleteTripID, id;
  print('1 : Delete all Trips \n'
      '2 : Delete Trip by ID');
  deleteTrip = intInputHelper(deleteTrip);
  if (deleteTrip == 1) {
    trips.removeRange(0, trips.length);
    runApp();
  } else if (deleteTrip == 2) {
    print('Please enter Trip ID :');
    deleteTripID = intInputHelper(deleteTripID);
    for (var i = 0; i < trips.length; i++) {
      id = trips[i].getId();
      if (deleteTripID == id) {
        trips.removeAt(i);
        runApp();
      }
    }
  } else {
    print('valid Choice ');
    deleteTripID();
  }
}

void viewTrip() {
  checkEmptyTrips();
  print('Trips By Date');
  for (var i = 0; i < trips.length; i++) {
    trips.sort((a, b) {
      var asdate = a.getDate();
      var aadate = b.getDate();
      return -asdate.compareTo(aadate);
    });
    print(trips[i].toString());
  }
  runApp();
}

void searchTrip() {
  checkEmptyTrips();
  var searchPrice, price, check;
  print('Please Enter Price To Search :');
  searchPrice = doubleInputHelper(searchPrice);
  for (var i = 0; i < trips.length; i++) {
    price = trips[i].getPrice();
    if (price == searchPrice) {
      print(trips[i].toString());
      check = true;
    }
  }
  if (check != true) {
    print('Not Found !! \n');
  }
  runApp();
}

void reverse() {
  showTrips();
  checkEmptyTrips();
  passengerList.fillRange(0,passengerList.length,0);
  var reverseTrip, tripID, passengerLimit, id, check;

  print('Select Trip By ID');
  reverseTrip = intInputHelper(reverseTrip);
  for (var i = 0; i < trips.length; i++) {
    tripID = trips[i].getId();
    if (reverseTrip == tripID){
      passengerLimit = trips[i].getPassengerLimit();
      id = i;
      check = true;
    }
  }
  if (check != true) {
    print('Not Found !! \n');
    runApp();
  }

  if (passengerLimit > passengerList[id]) {
    passengerList[id]++;
    print('trip reversed');
    print(
        'passenger = ${passengerList[id]} and passenger limit = $passengerLimit');
  } else {
    print('trip is full');
    reverse();
  }
  runApp();
}

void discount() {
  for (var i = 0; i < trips.length; i++) {
    var price = trips[i].getPrice();
    if (price >= 10000) {
      print(
          'the price for trip ${trips[i].getLocation()} is $price and now is ${price - ((10 * price) / 100)}\n');
    }
  }
  runApp();
}

void latestTrip() {
  var reversedList = List.from(trips.reversed);
  try {
    for (var i = 0; i < 10; i++) {
      print(reversedList[i].toString());
    }
    // ignore: empty_catches
  } catch (e) {}
  ;
  runApp();
}

void viewPassengers() {
  for (var i = 0; i < passengerList.length; i++) {
    print(
        'you have ${passengerList[i].toString()} passenger in Trip number: ${trips[i].getId()}');
  }
  var sum = 0;
  for (var i = 0; i < passengerList.length; i++) {
    sum = sum + passengerList[i];
  }
  print('all passengers in all trips is $sum\n');
  runApp();
}

// help methods
int intInputHelper(value) {
  value = int.tryParse(stdin.readLineSync());
  while (value == null || value < 1) {
    print('Please Enter a correct number :');
    value = int.tryParse(stdin.readLineSync());
  }
  return value;
}

double doubleInputHelper(value) {
  value = double.tryParse(stdin.readLineSync());
  while (value == null || value < 1) {
    print('Please Enter a correct number :');
    value = double.tryParse(stdin.readLineSync());
  }
  return value;
}

DateTime dateInputHelper(value) {
  value = DateTime.tryParse(stdin.readLineSync());
  while (value == null) {
    print('Please Enter Date Like ( YYYY-MM-DD )  :');
    value = DateTime.tryParse(stdin.readLineSync());
  }
  return value;
}

void checkEmptyTrips() {
  if (trips.isEmpty) {
    print('no trips to delete');
    runApp();
  }
}

void showTrips() {
  for (var i = 0; i < trips.length; i++) {
    print(trips[i].toString());
  }
}