<?php

function loop_condition(int $number){
  if($number % 3 == 0 && $number % 5 == 0) return 'FooBar';
  if($number % 3 == 0) return 'Foo';
  if($number % 5 == 0) return 'Bar';

  return '';
}

for($i = 1; $i <= 50; $i++){
  echo $i . ' : ' . loop_condition($i) . '<br>';
}
?>