import 'dart:io';

class Food{
  File? imgFile;
  String? imgUrl;
  String? desc;
  String? name;
  String? waitTime;
  num? Score;
  String? cal;
  num? price; 
  num? quantity;
  List<Map<String, String>>? ingredients;
  String? about;
  bool? highLight;
  Food({
    this.imgFile,
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
    this.highLight=false}
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
  static Food generateFood(List list){
    List<Map<String, String>> map =[{"fd":"fds"}];
    return Food(
      imgUrl:list[0], 
      desc:list[1], 
      name:list[2], 
      waitTime: list[3],  
      Score:num.parse(list[4])  , 
      cal: list[5], 
      price:num.parse(list[6]), 
      quantity:num.parse(list[7]), 
      ingredients:map, 
      about:list[9],
      highLight: (list[10]=='true')? true: false );

  }

  static List<Food> generateRecommendFoods(){
    return [
      Food(imgUrl: 'assets/images/dish1.png',
      desc: 'No1. in sales',
      name: 'Chicken Biriyani',
      waitTime: '50 min',
      Score: 4.8,
      cal: '325 kcal',
      price: 12,
      quantity: 1,
      ingredients: [
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
      about: 'Baked with spices',
      highLight: true
      ),
    //  
    
      

    ];
  }


}