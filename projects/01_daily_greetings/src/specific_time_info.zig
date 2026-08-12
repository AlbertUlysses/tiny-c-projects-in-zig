const std = @import("std");

// creating a struct to move the information outside and use on main file
const TodayUTC = struct {
    day: u9,
    month: []const u8,
    numeric_month: u4,
    year: u16,
};

pub fn specific_time() TodayUTC {
    // get current time tied to io clock and using debug_io but can probably optimize the io
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
