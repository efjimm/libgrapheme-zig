const std = @import("std");
const cp = @import("codepoint.zig");
const Self = @This();

str: []const u21,
index: usize = 0,

fn next(self: *Self, comptime func: fn ([]const u21) usize) ?[]const u21 {
    if (self.index >= self.str.len) return null;
    const start = self.index;
    self.index += func(self.str[start..]);
    return self.str[start..self.index];
}

pub fn nextGrapheme(self: *Self) ?[]const u21 {
    return self.next(cp.nextCharacterBreak);
}

pub fn nextLineBreak(self: *Self) ?[]const u21 {
    return self.next(cp.nextLineBreak);
}

pub fn nextSentenceBreak(self: *Self) ?[]const u21 {
    return self.next(cp.nextSentenceBreak);
}

pub fn nextWordBreak(self: *Self) ?[]const u21 {
    return self.next(cp.nextWordBreak);
}

pub fn reset(self: *Self) void {
    self.index = 0;
}
