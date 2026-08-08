const std = @import("std");

const TodayUTC = struct {
    day: u9,
    month: []const u8,
    numeric_month: u4,
    year: u16,
};

pub fn specific_time() TodayUTC {
    const now = std.Io.Clock.now(std.Io.Clock.real, std.Options.debug_io);
    const seconds: std.time.epoch.EpochSeconds = .{
        .secs = @intCast(now.toSeconds()),
    };
    const epoch_day = seconds.getEpochDay();
    const year_day = epoch_day.calculateYearDay();
    const month_day = year_day.calculateMonthDay();
    const today_utc = TodayUTC{
        .day = month_day.day_index,
        .month = @tagName(month_day.month),
        .numeric_month = month_day.month.numeric(),
        .year = year_day.year,
    };
    return today_utc;
}

pub fn main() void {
    const today_utc = specific_time();
    std.debug.print("year: {d}, month: {s}\n day: {d}\n", .{ today_utc.year, today_utc.month, today_utc.day });
}
