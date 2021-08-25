
class User_data {
  String userName;
  String userEmail;
  String userPasword;
  String message;
  bool isLogged = false;


  void setuserName(String userName){
    this.userName = userName;
  }

  String getuserName(){
    return userName;
  }
  void setuserEmail(String userEmail){
    this.userEmail = userEmail;
  }

  String getuserEmail(){
    return userEmail;
  }

  void setuserPasword(String userPasword){
    this.userPasword = userPasword;
  }
  String getuserPasword(){
    return userPasword;
  }
  void setMessage(String message){
    this.message = message;
  }
  String getMessage(){
    return message;
  }

  bool getIsLogged(){
    return isLogged;
  }
  void setIsLogged(bool isLogged){
    this.isLogged = isLogged;
  }
}