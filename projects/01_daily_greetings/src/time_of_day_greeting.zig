const std = @import("std");

pub fn greeting() []const u8 {
    const now = std.Io.Clock.now(std.Io.Clock.real, std.Options.debug_io);
    const seconds: std.time.epoch.EpochSeconds = .{
        .secs = @intCast(now.toSeconds()),
    };
    // the 7 below hardcodes the PT timezone.
    // the addition of 5 is due to the fact that we need to get the current time
    var hour = seconds.getDaySeconds().getHoursIntoDay();
    if (hour < 7) {
        hour += 24;
    } else {
        hour -= 7;
    }

    const time_of_day = switch (hour) {
        0...11 => "morning",
        12...17 => "afternoon",
        else => "evening",
    };
    return time_of_day;
}
// todo
// implment section 2.3.3 Adding specific time info
