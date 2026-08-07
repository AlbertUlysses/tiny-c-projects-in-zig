const std = @import("std");

const TimeNow = struct {
    time_of_day: []const u8,
    hour: u5,
    minutes: u6,
    seconds: u6,
};
pub fn getTimeNow() TimeNow {
    const now = std.Io.Clock.now(std.Io.Clock.real, std.Options.debug_io);
    const seconds: std.time.epoch.EpochSeconds = .{
        .secs = @intCast(now.toSeconds()),
    };
    // the 7 below hardcodes the PT timezone.
    // the addition of 5 is due to the fact that we need to get the current time
    var day_seconds = seconds.getDaySeconds();
    var hour = day_seconds.getHoursIntoDay();
    if (hour < 7) {
        hour += 24;
    }
    hour -= 7;

    const time_of_day = switch (hour) {
        0...11 => "morning",
        12...17 => "afternoon",
        else => "evening",
    };
    return TimeNow{
        .time_of_day = time_of_day,
        .hour = hour,
        .minutes = day_seconds.getMinutesIntoHour(),
        .seconds = day_seconds.getSecondsIntoMinute(),
    };
}
