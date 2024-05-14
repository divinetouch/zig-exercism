const std = @import("std");

pub fn squareOfSum(number: usize) usize {
    var sum: usize = 0;

    for (1..number + 1) |i| {
        sum += i;
    }
    return sum * sum;

    // @compileError("compute the sum of i from 0 to n then square it");
}

pub fn sumOfSquares(number: usize) usize {
    var sum: usize = 0;

    for (1..number + 1) |i| {
        sum += i * i;
    }

    return sum;
    // @compileError("compute the sum of i^2 from 0 to n");
}

pub fn differenceOfSquares(number: usize) usize {
    const sosum: usize = squareOfSum(number);
    const sumos: usize = sumOfSquares(number);

    return sosum - sumos;

    // @compileError("compute the difference between the square of sum and sum of squares");
}
