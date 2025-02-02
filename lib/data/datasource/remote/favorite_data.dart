import 'package:tataboq_app/core/class/crud.dart';
import 'package:tataboq_app/linkapi.dart';

class FavoriteData {
  Crud crud;

  FavoriteData(this.crud);

  addFavorite(String userid, String itemid) async {
    var response = await crud.postData(
        AppLink.favoriteAdd, {"userid": userid.toString(), "itemid": itemid});

    return response.fold((l) => l, (r) => r);
  }

  removeFavorite(String userid, String itemid) async {
    var response = await crud.postData(AppLink.favoriteRemove,
        {"userid": userid.toString(), "itemid": itemid});

    return response.fold((l) => l, (r) => r);
  }
}
