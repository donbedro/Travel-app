class Trip {
  int _id , _passengerLimit , passenger;
  String _location ;
  DateTime _date;
  double _price;

  Trip( this._id, this._passengerLimit, this._location, this._price, this._date);


  double getPrice() => _price;
  void setPrice(value) {
    _price = value;
  }

  DateTime getDate() => _date;
  void setDate(value) {
    _date = value;
  }

  String getLocation() => _location;
  void setLocation( value) {
    _location = value;
  }

  int getPassengerLimit() => _passengerLimit;
  void setPassengerLimit(value) {
    _passengerLimit = value;
  }

  int getId() => _id;
  void setId(value) {
    _id = value;
  }

  @override
  String toString() {
    return 'Trip ID: $_id Passenger Limit: $_passengerLimit, Date: $_date, Location: $_location, Price: $_price';
  }
}