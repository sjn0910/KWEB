const factorial = n => {
    let result = 1;

    for (let i = 1; i <= n; i++) {
        result *= i;
    }

    return result;
} 

const permutation = (n, r) => factorial(n) / factorial(n-r);;
const combination = (n, r) => factorial(n) / factorial(n-r) / factorial(r);;
const multiPermutation = (n, r) => n**r;
const multiCombination = (n, r) => factorial(n+r-1)/factorial(n-1)/factorial(r);;

module.exports = {
    permutation: permutation,
    combination: combination,
    multiPermutation: multiPermutation,
    multiCombination: multiCombination,
};