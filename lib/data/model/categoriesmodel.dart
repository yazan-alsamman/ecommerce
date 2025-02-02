class Categoriesmodel {
  int? categorieId;
  String? cetegorieName;
  String? categorieNameAr;
  String? categorieImage;
  String? categorieDate;

  Categoriesmodel(
      {this.categorieId,
      this.cetegorieName,
      this.categorieNameAr,
      this.categorieImage,
      this.categorieDate});

  Categoriesmodel.fromJson(Map<String, dynamic> json) {
    categorieId = json['categorie_id'];
    cetegorieName = json['cetegorie_name'];
    categorieNameAr = json['categorie_name_ar'];
    categorieImage = json['categorie_image'];
    categorieDate = json['categorie_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['categorie_id'] = this.categorieId;
    data['cetegorie_name'] = this.cetegorieName;
    data['categorie_name_ar'] = this.categorieNameAr;
    data['categorie_image'] = this.categorieImage;
    data['categorie_date'] = this.categorieDate;
    return data;
  }
}