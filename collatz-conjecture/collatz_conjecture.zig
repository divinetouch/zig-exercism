// Please implement the `ComputationError.IllegalArgument` error.

pub const ComputationError = error{IllegalArgument};

pub fn steps(number: usize) ComputationError!usize {
    if (number == 0) {
        return ComputationError.IllegalArgument;
    }

    var result: usize = number;
    var count: usize = 0;

    while (result != 1) {
        if (@rem(result, 2) == 0) {
            result = result / 2;
        } else {
            result = result * 3 + 1;
        }
        count += 1;
    }

    return count;
    // @compileError("please implement the steps function");
}
