void main(){
  while( true ){
    if(захотелось кофейку){
      if(нехочется идти в кофейню){
    сделать самому();
  } else {
      подойти к кофеварке();
      налить воды();
      насыпать зерен();
      заварить кофе();
  }
    выпить кофе();
  } else {
    continue;
  }

}
}

void выбрать велосипед(){
  for(зайти на сайт){
    if(велосипед нравится) {
      заказать велосипед();
      оплатить заказ();
      break;
    } else {
      continue;
    }
  }
}

void собрать стул() {
  switch (наличие деталей) {
    case недостаточно деталей:
      дозаказать детали();
      break;
    case достаточно деталей:
      собрать полностью();
      break;
  }
}