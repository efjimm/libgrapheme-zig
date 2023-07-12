const std = @import("std");
const c = @cImport({
    @cInclude("grapheme.h");
});
const utf8 = @import("utf8.zig");

comptime {
    std.debug.assert(@sizeOf(c.uint_least32_t) == @sizeOf(u21));
}

pub const Iterator = @import("CodepointIterator.zig");

/// Returns the offset (in codepoints) to the next grapheme_cluster break in
/// the codepoint slice `str`. If a grapheme cluster begins at `str` this
/// offset is equal to the length of said grapheme cluster.
///
/// For UTF-8-encoded input data `utf8.nextCharacterBreak` can be used
/// instead.
pub fn nextCharacterBreak(str: []const u21) usize {
    return c.grapheme_next_character_break(@ptrCast(str.ptr), str.len);
}

/// Returns the offset (in codepoints) to the next possible line break in the
/// codepoint slice `str`.
///
/// For UTF-8-encoded input data `utf8.nextLineBreak` can be used instead.
pub fn nextLineBreak(str: []const u21) usize {
    return c.grapheme_next_line_break(@ptrCast(str.ptr), str.len);
}

/// Returns the offset (in codepoints) to the next sentence break in the
/// codepoint slice `str`. If a sentence begins at `str` this offset is equal
/// to the length of said sentence.
///
/// For UTF-8-encoded input data `utf8.nextSentenceBreak` can be used instead
pub fn nextSentenceBreak(str: []const u21) usize {
    return c.grapheme_next_sentence_break(@ptrCast(str.ptr), str.len);
}

/// Returns the offset (in codepoints) to the next word break in the codepoint
/// slice `str`. If a word begins at `str` this offset is equal to the length
/// of said word.
///
/// For UTF-8-encoded input data `utf8.nextWordBreak` can be used instead.
pub fn nextWordBreak(str: []const u21) usize {
    return c.grapheme_next_word_break(@ptrCast(str.ptr), str.len);
}
