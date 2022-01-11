class Food{
  String imgUrl;
  String desc;
  String name;
  String waitTime;
  num Score;
  String cal;
  num price;
  num quantity;
  List<Map<String, String>> ingredients;
  String about;
  bool highLight;
  Food(
    this.imgUrl,
    this.desc,
    this.name,
    this.waitTime,
    this.Score,
    this.cal,
    this.price,
    this.quantity,
    this.ingredients,
    this.about,
    {this.highLight=false}
  );
   Map<String,dynamic> toMap(){
    return{
      "imageUrl":this.imgUrl,
      "desc":this.desc,
      "name":this.name,
      "waitTime":this.waitTime,
      "Score":this.Score,
      "cal":this.cal,
      "Price":this.price,
      "quantity":this.quantity,
      "ingredients":this.ingredients,
      "about":this.about,
      "highLight":this.highLight=false
    };
  }

  static List<Food> generateRecommendFoods(){
    return [
      Food('assets/images/dish1.png',
      'No1. in sales',
      'Chicken Biriyani',
      '50 min',
      4.8,
      '325 kcal',
      12,
      1,
      [
        {
        'Noodle':'assets/images/ingre1.png'
        },
        {
          'Shrimp':'assets/images/ingre2.png'
        },
        {
          'Egg':'assets/images/ingre3.png'
        },
        {
          'Scallion':'assets/images/ingre4.png'
        },
      ],
      'Baked with spices',
      highLight: true
      ),
      Food('assets/images/dish2.png',
      'No2. in sales',
      'Mutton Biriyani',
      '50 min',
      4.8,
      '325 kcal',
      12,
      1,
      [
        {
        'Noodle':'assets/images/ingre1.png'
        },
        {
          'Shrimp':'assets/images/ingre2.png'
        },
        {
          'Egg':'assets/images/ingre3.png'
        },
        {
          'Scallion':'assets/images/ingre4.png'
        },
      ],
      'Baked with spices',
      highLight: true
      ),
    Food('assets/images/dish2.png',
      'No2. in sales',
      'Beef Biriyani',
      '50 min',
      4.8,
      '325 kcal',
      12,
      1,
      [
        {
        'Noodle':'assets/images/ingre1.png'
        },
        {
          'Shrimp':'assets/images/ingre2.png'
        },
        {
          'Egg':'assets/images/ingre3.png'
        },
        {
          'Scallion':'assets/images/ingre4.png'
        },
      ],
      'Baked with spices',
      highLight: true
      )

    ];
  }


}