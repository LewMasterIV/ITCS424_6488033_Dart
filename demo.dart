void main (){
  // Map constructor, create Map by using Class generic template
  Map<String, List<int>> myProduct = {
    'iphone'  : [48000, 50000, 52000],
    'Note 12' : [35000, 36000, 38000],
    'Mi'      : [30000]
  };  
  myProduct.forEach((key, value) {print('$key : $value');});

  print('7 - 3 = ${sub(7,3)}');

  print(personInfo(first_name: 'Sylvia', family_name: 'Netheria',));
}

int sub(int x, int y){
  int r;
  r = x-y;
  return r;
}

String personInfo ({String? first_name, String? family_name}){
  return '$first_name $family_name';
}