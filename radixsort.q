
// O(n*k) k is digits in largest number in inputs
radixSort: {[LIST]   {x iasc mod[;10] x div 10 xexp y}/[LIST; til count 10 vs max LIST]   }