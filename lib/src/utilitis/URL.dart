class Url {
  //static const url = "http://cliprzh-001-site2.ftempurl.com/api/";
  static const url = "http://192.168.137.1:3000/api";
  static const baseImageUrl = "http://192.168.137.1:3000/images/";
  static const baseTripsImageUrl = "http://192.168.137.1:3000/trips/";
  static const urlSignalR = "http://cliprzh-001-site2.ftempurl.com/BookingHub";
  static const login = "${url}/user/signIn";
  static const reSendOTP = "${url}Identity/ReSendOTP";
  static const verifyOTP = "${url}Identity/VerifyOTP";
  static const register = "${url}/user/signUp";
  static const changePassword = "${url}Patient/changePassword";
  static const trip = "${url}/trip";
  static const paypalPayment = "${url}/paypal/pay";
  static const favoriteTrip = "${url}/favorite";
}
