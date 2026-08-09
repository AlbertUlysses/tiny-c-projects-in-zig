const std = @import("std");

pub fn moon_phase(year: u16, month: u4, day: u9) []const u8 {
    const phase = [_][]const u8{ "waxing crescent", "at first quarter", "waxing gibbous", "full", "waning gibbous", "at last quarter", "waning crescent", "new" };
    var d = day;
    const m = @floatFromInt(month);
    if (m == 2) {
        d += 31;
    }
    d += 59 + (m - 3) * 30.6 + 0.5;
    const g = (year - 1990) % 19;
    const e = (11 * g + 29) % 30;
    if ((e == 25) | (e == 24)) {
        e += 1;
    }
    const mp = ((((e + d) * 6 + 5) % 177) / 22 & 7);
    return phase[mp];
}
