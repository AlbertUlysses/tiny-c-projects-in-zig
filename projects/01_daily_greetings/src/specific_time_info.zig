const std = @import("std");

pub fn specific_time() void {
    // []const u8 {
    const now = std.Io.Clock.now(std.Io.Clock.real, std.Options.debug_io);
    const seconds: std.time.epoch.EpochSeconds = .{
        .secs = @intCast(now.toSeconds()),
    };
    // the 7 below hardcodes the PT timezone.
    // the addition of 5 is due to the fact that we need to get the current time
    // const day_seconds = seconds.getDaySeconds();
    const epoch_day = seconds.getEpochDay();
    // var hour = day_seconds.getHoursIntoDay();
    // if (hour < 7) {
    //     hour += 24;
    // } else {
    //     hour -= 7;
    // }
    // const minutes = day_seconds.getMinutesIntoMinute();
    // const seconds = day_seconds.getSecondsIntoMinute();
    // const it_is = "It is {hour}:{minutes}:{seconds}";
    // return temp;
    const year_day = epoch_day.calculateYearDay();
    const month_day = year_day.calculateMonthDay();
    std.debug.print("year: {any}, month: {any}\n day: {any}\n", .{ year_day.year, month_day.month, month_day.day_index });
}

pub fn main() void {
    specific_time();
}
