const std = @import("std");

pub fn main(init: std.process.Init) !void {
    const arena: std.mem.Allocator = init.arena.allocator();

    // Accessing command line arguments:
    const args = try init.minimal.args.toSlice(arena);

    // Prints to stderr, unbuffered, ignoring potential errors.
    // This is appropriate for anything that lives as long as the process.
    // This should have a command for each section
    if (args.len < 2) {
        std.debug.print("Hello, you handsome beast!\n", .{});
    } else {
        std.debug.print("Greetings, {s}!\n", .{args[1]});
    }
}
