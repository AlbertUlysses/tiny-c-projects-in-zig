const std = @import("std");
const Io = std.Io;

const time_of_day = @import("time_of_day_greeting.zig");

pub fn main(init: std.process.Init) !void {
    const arena: std.mem.Allocator = init.arena.allocator();

    // Accessing command line arguments:
    const args = try init.minimal.args.toSlice(arena);

    // Prints to stderr, unbuffered, ignoring potential errors.
    // This is appropriate for anything that lives as long as the process.
    if (args.len < 2) {
        std.debug.print("Hello, you handsome beast!\n", .{});
    } else {
        std.debug.print("Good.. {s}, {s}!\n", .{ time_of_day.greeting(), args[1] });
    }
}
