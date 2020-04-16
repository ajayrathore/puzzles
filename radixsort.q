
// O(n*k) k is digits in largest number in input
radixSort: {[LIST;DIGITS] {x iasc mod[;10] x div 10 xexp y}/[LIST;til DIGITS]}