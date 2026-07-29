const std = @import("std");

pub fn main() void {
    const now = std.Io.Clock.now(std.Io.Clock.real, std.Options.debug_io);
    const seconds: std.time.epoch.EpochSeconds = .{
        .secs = @intCast(now.toSeconds()),
    };

    std.debug.print("Epoch Time: {any}, Hour of Day: {any}\n", .{ @TypeOf(now.toSeconds()), seconds.getDaySeconds().getHoursIntoDay() - 7 });
}
