const std = @import("std");
const Io = std.Io;

const time_of_day = @import("time_of_day_greeting.zig");

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
        switch (args[1]) {
        "general" => std.debug.print("Good.. {s}, {s}!\n", .{ time_of_day.greeting(), args[2] }),
        "specific_time" => std.debug.print("Good.. {s}, {s}!\n", .{ time_of_day.greeting(), args[2] }),
        else => std.debug.print("Not a valid arg.", .{}),
        }
    }
}
