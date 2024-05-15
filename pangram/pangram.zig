const std = @import("std");

pub fn isPangram(str: []const u8) bool {
    const chars = "abcdefghijklmnopqrstuvwxyz";

    if (str.len < chars.len) {
        return false;
    }

    const allocator = std.heap.page_allocator;
    var list = std.AutoHashMap(u8, u8).init(allocator);

    for (str) |c| {
        const lower = std.ascii.toLower(c);
        const exist = list.get(lower);

        if (exist) |_| {
            continue;
        } else {
            if (std.ascii.isAlphabetic(c)) {
                list.put(lower, lower) catch continue;
            }
        }
    }

    defer list.deinit();

    return list.count() == chars.len;
}

// community answer
pub fn isCommunityPangram(str: []const u8) bool {
    var letters = std.bit_set.IntegerBitSet(26).initEmpty();
    for (str) |c| {
        if (!std.ascii.isAlphabetic(c)) continue;
        letters.set(std.ascii.toLower(c) - 'a');
    }
    return letters.count() == 26;
}

// testing empty array
pub fn main() !void {
    var array: [26]u8 = undefined;
    array[0] = 'a';
    array[1] = 'b';

    for (array) |value| {
        std.debug.print("{c} {any}", .{ value, value });
    }

    std.debug.print("{} {}", .{ array.len, array[0] });
}
