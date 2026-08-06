const std = @import("std");
const Io = std.Io;

const time_now = @import("time_now.zig");
const specific_time = @import("specific_time_info.zig");

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
        // fix the issue with string switches
        "general" => {
            const current_time = time_now.getTimeNow();
            std.debug.print("Good.. {s}, {s}!\n", .{ current_time.time_of_day, args[2] });
        },
        "specific_time" => {
            const current_time = time_now.getTimeNow();
            const today_utc = specific_time.specific_time(); 
            std.debug.print("Greetings, {s}!\n Today is {s} {d}, {d}\nIt is {d}:{d}:{d}", .{args[2], today_utc.month, today_utc.year, today_utc.day,  current_time.hour,current_time.mintue, current_time.second});
        },
        else => std.debug.print("Not a valid arg.", .{}),
        }
    }
}
