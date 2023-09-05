<?php

function div_round_number(int $divided, int $divider): int
{
  while($divided >= $divider) {
    $divided -= $divider;
  }

  return $divider + $divided;
}

echo div_round_number(8, 4);
?>