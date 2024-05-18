const std = @import("std");

pub fn isIsogram(str: []const u8) bool {
    var list = std.AutoHashMap(u8, i32).init(std.heap.page_allocator);
    defer list.deinit();

    for (str) |c| {
        const lower = std.ascii.toLower(c);
        if (list.getKey(lower)) |_| {
            return false;
        } else if (std.ascii.isAlphabetic(c)) {
            list.put(lower, 1) catch return false;
        }
    }

    return true;
}
