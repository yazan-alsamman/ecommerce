class AppLink {
  //static const String server = "http://localhost:8081/ecommerce";
  static const String server = "http://192.168.98.130:8081/ecommerce";
  //static const String server = "http://169.254.123.209:8081/ecommerce";
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

  //adress
  static const String adressView = "$server/adress/view.php";
  static const String adressAdd = "$server/adress/add.php";
  static const String adressEdit = "$server/adress/edit.php";
  static const String adressdelete = "$server/adress/delete.php";

  //coupon
  static const String checkcoupon = "$server/coupon/checkcoupon.php";

  //checkout
  static const String checkout = "$server/orders/checkout.php";
  static const String pendingOrders = "$server/orders/pending.php";
  static const String archivedOrders = "$server/orders/archive.php";
  static const String ordersdetails = "$server/orders/details.php";
  static const String ordersdelete = "$server/orders/delete.php";

  //notification
  static const String saveDevice = "$server/register-device.php";

  //offers
  static const String offers = "$server/offers.php";

//rating
  static const String rating = "$server/rating.php";
}
