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

        // std.debug.print("\n{d}^{d} = {d}\n", .{ n, power, std.math.pow(u32, n, power) });
    }

    // std.debug.print("\n\tresult: {}, num: {}, sum: {}\n", .{ sum == num, num, sum });

    return sum == num;
}

// pub fn main() !void {
//     _ = isArmstrongNumber(186_709_961_001_538_790_100_634_132_976_990);
// }
