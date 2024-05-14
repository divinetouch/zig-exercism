const std = @import("std");
const print = std.debug.print;
const HashMap = std.AutoHashMap;

fn getHash() error{OutOfMemory}!HashMap(u8, u32) {
    var letterMap = HashMap(u8, u32).init(std.heap.page_allocator);

    try letterMap.put('a', 1);
    try letterMap.put('e', 1);
    try letterMap.put('i', 1);
    try letterMap.put('o', 1);
    try letterMap.put('u', 1);
    try letterMap.put('l', 1);
    try letterMap.put('n', 1);
    try letterMap.put('r', 1);
    try letterMap.put('s', 1);
    try letterMap.put('t', 1);
    try letterMap.put('d', 2);
    try letterMap.put('g', 2);
    try letterMap.put('b', 3);
    try letterMap.put('c', 3);
    try letterMap.put('m', 3);
    try letterMap.put('p', 3);
    try letterMap.put('f', 4);
    try letterMap.put('h', 4);
    try letterMap.put('v', 4);
    try letterMap.put('w', 4);
    try letterMap.put('y', 4);
    try letterMap.put('k', 5);
    try letterMap.put('j', 8);
    try letterMap.put('x', 8);
    try letterMap.put('q', 10);
    try letterMap.put('z', 10);

    return letterMap;
}

fn getValue(key: u8) u32 {
    const letterMap = getHash() catch return 0;
    const v = letterMap.get(std.ascii.toLower(key));
    if (v) |value| {
        return value;
    } else {
        return 0;
    }
}

pub fn score(s: []const u8) u32 {
    var sum: u32 = 0;

    for (s) |key| {
        const val = getValue(key);
        sum += val;
    }

    return sum;
}

pub fn main() void {
    const s = score("hello");
    print("{}", .{s});
}
