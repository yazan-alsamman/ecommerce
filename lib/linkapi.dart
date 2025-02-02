class AppLink {
  static const String server = "http://192.168.45.130:8081/ecommerce";
  static const String test = "$server/test.php";
//Images
  static const String imagestatic = "$server/upload";
  static const String imagecategories = "$imagestatic/categories";
  static const String imageitems = "$imagestatic/items/";

//Authentication
  static const String signup = "$server/auth/signup.php";
  static const String login = "$server/auth/login.php";
  static const String verifycodesignup = "$server/auth/verifycode.php";
  static const String resend = "$server/auth/resend.php";

//forget Password
  static const String checkEmail = "$server/forgetpassword/checkemail.php";
  static const String resetPassword =
      "$server/forgetpassword/resetpassword.php";
  static const String verifyCodeForgetPassword =
      "$server/forgetpassword/verifycode.php";

//Home
  static const String homepage = "$server/home.php";
//items
  static const String items = "$server/items/items.php";
  static const String itemsSales = "$server/items/sales.php";
  static const String searchItems = "$server/items/search.php";

//fav
  static const String favoriteAdd = "$server/favorite/add.php";
  static const String favoriteRemove = "$server/favorite/remove.php";
  static const String favoriteView = "$server/favorite/view.php";
  static const String deletefromfavorite =
      "$server/favorite/deletefromfavorite.php";

  //cart
  static const String cartview = "$server/cart/view.php";
  static const String cartadd = "$server/cart/add.php";
  static const String cartdelete = "$server/cart/delete.php";
  static const String cartgetcountitem = "$server/cart/getcountitems.php";
}
