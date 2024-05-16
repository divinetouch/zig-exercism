const std = @import("std");

pub fn isArmstrongNumber(num: u128) bool {
    var buf: [256]u8 = undefined;

    const str = std.fmt.bufPrint(&buf, "{}", .{num}) catch return false;

    if (str.len == 1) {
        return true;
    }

    var sum: u128 = 0;
    const power: u32 = @truncate(str.len);

    for (str) |c| {
        const n = std.fmt.parseInt(u32, &[1]u8{c}, 10) catch return false;

        sum += std.math.pow(u128, n, power);
    }

    return sum == num;
}
